import hashlib
import random

import time

import os
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from mmloo_shop.models import UserInfo, Lunbo
from mysite14 import settings


def index(request):
    # 获取轮播图数据
    data = {}
    lunbos = Lunbo.objects.all()

    data['lunbos']=lunbos

    # 获取导航数据
    # navs = Nav.objects.all()
    #
    # # 获取每日必购数据
    # mustbuys = Mustbuy.objects.all()
    #
    # # 商品部分数据
    # shops = Shop.objects.all()  # 所有
    # shophead = shops[0]
    # shoptabs = shops[1:3]
    # shopclass = shops[3:7]
    # shopcommends = shops[7:11]

    # 商品列表
    # mainShows = MainShow.objects.all()
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
    if request.method == 'GET':
        return render(request, 'tb-cart.html')


def details(request):
    if request.method == 'GET':
        return  render(request,'details.html')
