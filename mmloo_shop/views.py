import hashlib
import random

import time

import os
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from mmloo_shop.models import UserInfo, Lunbo, Good, Cart, Order, OrderGoods
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
        carts = Cart.objects.filter(user=user)
        if carts.exists():
            data['carts'] = carts
            data['typenum'] = carts.count()
        allnum = 0
        for cart in carts:
            allnum += cart.number
        data['uesr'] = user
        data['utel'] = user.db_utel
        data['headimg'] = user.db_headimg
        data['allnum'] = allnum
        print(allnum)

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


def mine(request):
    token = request.session.get('token')

    data = {}

    if token:
        user = UserInfo.objects.get(db_token=token)
        data['name'] = user.db_utel
        data['img'] = user.db_headimg

        # 未付款、已付款...
        orders = Order.objects.filter(user=user)
        data['waitpay'] = orders.filter(status=0).count()
        data['paydone'] = orders.filter(status=1).count()

    return render(request, 'mine.html', context=data)




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
        carts = Cart.objects.filter(user=user)
        return render(request, 'tb-cart.html',context={
            'user':user,
            'carts': carts
        })
    else:
        return redirect('mmloo_shop:login')

def subcart(request):
    token = request.session.get('token')
    goodsid = request.GET.get('goodsid')

    user = UserInfo.objects.get(db_token=token)
    goods = Good.objects.get(goodid=goodsid)

    # 找到对应的购物车该商品信息
    cart = Cart.objects.filter(user=user).filter(goods=goods).first()
    # 删除该商品
    cart.delete()
    data = {
        'msg': '该商品删除成功',
        'status': 1,
    }

    return JsonResponse(data)


def addcart(request):
    # 获取token  >> user
    token = request.session.get('token')

    # 获取商品id
    goodsid = request.GET.get('goodsid')
    numbers = request.GET.get('numbers')
    print(goodsid)
    print(numbers)

    data = {}

    if token:   # 登录
        # 获取用户
        user = UserInfo.objects.get(db_token=token)
        # 获取商品
        goods = Good.objects.get(goodid=goodsid)

        # 1、 第一次添加的商品是不存在的，要往数据库中添加一条新记录
        # 2、 商品已存在，即修改商品数量

        # 判断需要添加的商品是否存在
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():  # 存在
            cart = carts.first()
            cart.number = cart.number + int(numbers)
            cart.save()
        else:   # 不存在
            cart = Cart()
            cart.user = user
            cart.goods = goods
            cart.number = int(numbers)
            cart.save()

        return JsonResponse({'msg':'{},添加购物车成功'.format(goods.good_detail), 'number':cart.number, 'status': 1})

    else:   # 没登录
        # ajax操作中，不能重定向
        # ajax异步请求操作，数据的传输
        # 即ajax请求，如果想页面跳转(服务器重定向不了)，客户端处理
        # return redirect('axf:login')
        data['msg'] = '请登录后操作!'
        data['status'] = -1
        return JsonResponse(data)



def details(request,num):
    data = {}
    good = Good.objects.get(goodid=int(num))
    data['good'] = good
    token = request.session.get('token')
    if token:
        user = UserInfo.objects.get(db_token=token)
        data['user'] = user
        carts = Cart.objects.filter(user=user)
        if carts.exists():
            data['carts'] = carts
            data['typenum'] = carts.count()
            allnum = 0
            for cart in carts:
                allnum += cart.number
            data['allnum'] = allnum

        return render(request, 'details.html', context=data)

    return render(request,'details.html',context={'good':good})



def changecartstatus(request):
    cartid = request.GET.get('cartid')

    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect   # 取反
    cart.save()

    data = {
        'msg': '修改状态成功',
        'status': 1,
        'isselect': cart.isselect
    }

    return JsonResponse(data)


def changecartisall(request):
    token = request.session.get('token')
    user = UserInfo.objects.get(db_token=token)
    carts = Cart.objects.filter(user=user)

    # 全选/取消全选
    isall = request.GET.get('isall')
    if isall == 'true':
        isall = True
    else:
        isall = False

    for cart in carts:
        cart.isselect = isall
        cart.save()


    data = {
        'msg': '全选/取消全选',
        'status': 1
    }

    return JsonResponse(data)


def generate_identifier():
    temp = str(random.randrange(1000,10000)) + str(int(time.time())) + str(random.randrange(1000,10000))
    return temp


def generateorder(request):

    token = request.session.get('token')
    user = UserInfo.objects.get(db_token=token)

    # 生成订单
    order = Order()
    order.user = user
    order.identifier = generate_identifier()
    order.save()

    # 订单商品 【选中的商品，即isselect】
    carts = Cart.objects.filter(user=user).filter(isselect=True)
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.number = cart.number
        orderGoods.save()

        # 从购物车中移除
        cart.delete()

    data = {
        'msg': '下单成功',
        'status': 1,
        'identifier': order.identifier
    }

    return JsonResponse(data)


def orderdetail(request,identifier):
    # identifier = request.GET.get('identifier')

    # 找到对应的订单信息
    order = Order.objects.get(identifier=identifier)

    return render(request, 'orderdetail.html', context={'order':order})


# stu : 订单状态 【显示】
def orderlist(request, stu):
    # 订单列表 【未付款、已付款....】

    token = request.session.get('token')
    user = UserInfo.objects.filter(db_token=token)

    orders = Order.objects.filter(user=user).filter(status=stu)

    return render(request, 'orderlist.html', context={'orders':orders})


def appnotify(request):

    body_str = request.body.decode('utf-8')

    # out_trade_no =
    # 获取对应的订单，修改状态

    return JsonResponse({'msg':'success'})


def returenview(request):
    return redirect('axf:orderdetail',0)


def pay(request):
    identifier = request.GET.get('identifier')

    # 支付地址
    url = alipay.direct_pay(
        subject='iPhone X[土豪金，64G]', # 订单标题
        out_trade_no=identifier,    # 订单号[axf]
        total_amount=9.9,   # 支付金额
        return_url='http://112.74.55.3/axf/returenview/'
    )

    # 拼接支付网关
    alipay_url = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=url)

    return JsonResponse({'alipay_url':alipay_url, 'status':1})

