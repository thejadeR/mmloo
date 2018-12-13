from django.conf.urls import url

from mmloo_shop import views

urlpatterns = [
    url(r'^$',views.index,name='index'),

    url(r'^login/$',views.login,name='login'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^mine/$',views.mine,name='mine'),
    url(r'^register/$',views.register,name='register'),
    url(r'^checkutel/$',views.checkutel,name='checkutel'),

    url(r'^uploadheadimg/$',views.uploadheadimg,name='uploadheadimg'),

    url(r'^tb-cart/$',views.cart,name='tb-cart'),
    url(r'^addcart/$',views.addcart,name='addcart'),
    url(r'^subcart/$', views.subcart, name='subcart'),

    url(r'^details/(\d+)/$',views.details,name='details'),

    url(r'^changecartstatus/$', views.changecartstatus, name='changecartstatus'),  # 选中状态处理
    url(r'^changecartisall/$', views.changecartisall, name='changecartisall'),  # 全选/取消全选

    url(r'^generateorder/$', views.generateorder, name='generateorder'),  # 下单
    url(r'^orderdetail/(\d+)/$', views.orderdetail, name='orderdetail'),  # 订单详情
    url(r'orderlist/(\d+)/$', views.orderlist, name='orderlist'),

    url(r'^appnotify/$', views.appnotify, name='appnotify'),  # 支付成功后，支付宝调用的(通知服务器 哪个订单已经付款了)
    url(r'^returenview/$', views.returenview, name='returenview'),  # 支付宝成功后，客户端 从支付宝页面 返回到AXF项目页面
    url(r'^pay/$', views.pay, name='pay'),  # 付款

]