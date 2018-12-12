from django.conf.urls import url

from mmloo_shop import views

urlpatterns = [
    url(r'^$',views.index,name='index'),

    url(r'^login/$',views.login,name='login'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^register/$',views.register,name='register'),
    url(r'^checkutel/$',views.checkutel,name='checkutel'),

    url(r'^uploadheadimg/$',views.uploadheadimg,name='uploadheadimg'),

    url(r'^tb-cart/$',views.cart,name='tb-cart'),

    url(r'^addcart/$',views.addcart,name='addcart'),
    url(r'^details/(\d+)/$',views.details,name='details'),



]