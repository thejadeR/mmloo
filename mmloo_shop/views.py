import hashlib
import random

import time

import os
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from mmloo_shop.models import UserInfo, Lunbo, Good, Cart
from mysite14 import settings


def index(request):
    # 获取轮播图数据
    data = {}
    lunbos = Lunbo.objects.all()
    data['lunbos']=lunbos

    goods = Good.objects.all()
    data['goods'] = goods

    token = request.session.get('token')

    if token:
        user = UserInfo.objects.get(db_token=token)
        data['uesr'] = user
        data['utel'] = user.db_utel
        data['headimg'] = user.db_headimg

    # data = {
    #
    #
    #     # 'navs': navs,
    #     # 'mustbuys': mustbuys,
    #     # 'shophead': shophead,
    #     # 'shoptabs': shoptabs,
    #     # 'shopclass': shopclass,
    #     # 'shopcommends': shopcommends,
    #     # 'mainShows': mainShows
    # }


    return render(request, 'index.html', context=data)


def generate_token():
    token = str(time.time()) + str(random.random())
    mymd5 = hashlib.md5()
    mymd5.update(token.encode('utf-8'))
    return mymd5.hexdigest()


def generate_psword(password):
    mymd5 = hashlib.md5()
    mymd5.update(password.encode('utf-8'))
    return mymd5.hexdigest()


def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    elif request.method == 'POST':
        utel = request.POST.get('utel')
        pwd = request.POST.get('pwd')
        # 加密密码
        upassword = generate_psword(pwd)
        user = UserInfo.objects.filter(db_utel=utel).filter(db_upassword=upassword)
        if user.exists():
            user = user.first()
            # response = redirect('mmloo_shop:index')
            user.db_token = generate_token()
            user.save()
            request.session['token'] = user.db_token
            return redirect('mmloo_shop:index')
        else:
            return render(request, 'login.html',context={
                'error':'用户名或者密码错误'
            })


def logout(request):
    request.session.flush()
    return redirect('mmloo_shop:index')



def register(request):
    if request.method == 'GET':
        return render(request, 'register.html')

    elif request.method == 'POST':
        u = UserInfo()
        print(request.POST)
        u.db_utel = request.POST.get('utel')
        password = request.POST.get('pwd')
        # 加密密码
        u.db_upassword = generate_psword(password)
        u.db_token = generate_token()
        u.save()
        request.session['token'] = u.db_token

        response = redirect('mmloo_shop:index')
        # response.set_cookie('uname', u.db_uname)
        return response


def uploadheadimg(request):
    token = request.session.get('token')
    user = UserInfo.objects.filter(db_token=token).first()
    if request.method=='GET':
        return render(request,'uploadheadimg.html',context={'user':user})
    elif request.method=='POST':
        file = request.FILES.get('headimg')
        filename = str(random.randrange(1,100)) + '-' + file.name
        filepath = os.path.join(settings.MEDIA_ROOT,'uploadfiles\headimg\{}'.format(filename))
        print(filepath)
        print(settings.MEDIA_ROOT)
        with open(filepath,'wb') as fp:
            for item in file.chunks():
                fp.write(item)

        response = redirect('mmloo_shop:index')
        # a=filepath.split('untitled')
        user.db_headimg=filename
        user.save()
        # print(filename)
        return response


def checkutel(request):
    # 手机
    utel = request.GET.get('utel')
    print(utel)

    users = UserInfo.objects.filter(db_utel=utel)
    if users.exists():
        return JsonResponse({'msg': '手机号不符合条件或者已被注册!', 'status': 0})
    else:
        return JsonResponse({'msg': '手机号可以使用!', 'status': 1})


def cart(request):
    # if request.method == 'GET':
    token = request.session.get('token')
    if token:
        user = UserInfo.objects.get(db_token=token)
        carts = Cart.objects.filter(user=user).exclude(number=0)
        return render(request, 'tb-cart.html',context={
            'user':user,
            'carts': carts
        })
    else:
        return redirect('mmloo_shop:login')


def addcart(request):
    # 获取token  >> user
    token = request.session.get('token')

    # 获取商品id
    goodsid = request.GET.get('goodsid')
    print(goodsid)

    data = {}

    if token:   # 登录
        # 获取用户
        user = UserInfo.objects.get(db_token=token)
        # 获取商品
        goods = Good.objects.get(pk=goodsid)

        # 1、 第一次添加的商品是不存在的，要往数据库中添加一条新记录
        # 2、 商品已存在，即修改商品数量

        # 判断需要添加的商品是否存在
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():  # 存在
            cart = carts.first()
            cart.number = cart.number + 1
            cart.save()
        else:   # 不存在
            cart = Cart()
            cart.user = user
            cart.goods = goods
            cart.number = 1
            cart.save()

        return JsonResponse({'msg':'{},添加购物车成功'.format(goods.productlongname), 'number':cart.number, 'status': 1})

    else:   # 没登录
        # ajax操作中，不能重定向
        # ajax异步请求操作，数据的传输
        # 即ajax请求，如果想页面跳转(服务器重定向不了)，客户端处理
        # return redirect('axf:login')
        data['msg'] = '请登录后操作!'
        data['status'] = -1
        return JsonResponse(data)








def details(request,num):
    token = request.session.get('token')
    user = UserInfo.objects.filter(db_token=token).first()
    good=Good.objects.all()[int(num)-1]

    return render(request,'details.html',context={'good':good,'user':user})


