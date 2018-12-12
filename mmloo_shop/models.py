from django.db import models


# Create your models here.
class UserInfo(models.Model):
    # import random
    # unum = random.randint(0,100000000)
    # db_uname = models.CharField(max_length=40,unique=True,default='用户{}'.format(unum))
    db_headimg = models.CharField(max_length=150, default='person.png')

    db_utel = models.CharField(max_length=20,unique=True)
    db_upassword = models.CharField(max_length=256)


    db_token = models.CharField(max_length=256,default='')


    db_uFirstTime = models.DateTimeField(auto_now=True)
    db_uLastTime = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return '用户电话:{}-创建时间:{}-最后修改时间:{}'.format(self.db_utel,self.db_uFirstTime,self.db_uLastTime)
    class Meta:
        db_table = 'mmloo_userinfos'



class Lunbo(models.Model):

    db_img = models.ImageField(upload_to='uploadfiles/lunboimg/')
    db_img_detail = models.CharField(max_length=100)


    db_img_firsttime = models.DateTimeField(auto_now_add=True)
    db_img_lasttime = models.DateTimeField(auto_now=True)
    def __str__(self):
        return '图片详情:{}-创建时间:{}-最后修改时间:{}-图片名字:{}'.format(
            self.db_img_detail,self.db_img_firsttime,
            self.db_img_lasttime,self.db_img)
    class Meta:
        db_table = 'mmloo_lunbos'


class Good(models.Model):
    good_img = models.ImageField(max_length=255,upload_to='uploadfiles/detailimg')


    picture1 = models.ImageField(max_length=255,upload_to='uploadfiles/detailimg')
    picture2 = models.ImageField(max_length=255, upload_to='uploadfiles/detailimg')
    picture3 = models.ImageField(max_length=255, upload_to='uploadfiles/detailimg')
    picture4 = models.ImageField(max_length=255, upload_to='uploadfiles/detailimg')

    good_detail = models.CharField(max_length=100)
    good_price = models.DecimalField(max_digits=10,decimal_places=2)
    market_price = models.DecimalField(max_digits=10, decimal_places=2)
    goodid = models.IntegerField(max_length=10,default=1)
    def __str__(self):
        return self.good_detail
    class Meta:
        db_table = 'mmloo_goods'



#
# class Goods(models.Model):
#     num = models.CharField(max_length=20)
#     name = models.CharField(max_length=255)
#     price = models.CharField(max_length=50)
#     mbbprice = models.CharField(max_length=50)
#     unit = models.CharField(max_length=20)
#     heading = models.CharField(max_length=255)
#     pic1 = models.CharField(max_length=255)
#     pic2 = models.CharField(max_length=255,null=True)
#     pic3 = models.CharField(max_length=255,null=True)
#     def __str__(self):
#         return self.name
#
# class Detail(models.Model):
#     num = models.CharField(max_length=20)
#     name = models.CharField(max_length=255)
#     detail = models.CharField(max_length=255)
#     price = models.CharField(max_length=20)
#     mmlprice = models.CharField(max_length=20)
#     # comment = models.CharField(max_length=50)
#     # place = models.CharField(max_length=255)
#
#     headimg = models.CharField(max_length=255)
#     picnum=models.CharField(max_length=255)
#     picture1 = models.CharField(max_length=255)
#     picture2 = models.CharField(max_length=255)
#     picture3 = models.CharField(max_length=255)
#     picture4 = models.CharField(max_length=255)
#
#     def __str__(self):
#         return self.name

# class Text(models.Model):
#     str=HTMLField()
#
#
class Cart(models.Model):
    # 用户
    user = models.ForeignKey(UserInfo)
    # 商品
    goods = models.ForeignKey(Good)
    # 商品个数
    number = models.IntegerField()
    # 是否选中
    isselect = models.BooleanField(default=True)

    class Meta:
        db_table = 'mmloo_carts'
#
# class Order(models.Model):
#     user = models.ForeignKey(User)
#     ordernum=models.CharField(max_length=255)
#     adv = models.CharField(max_length=255)
#     status=models.IntegerField(default=0)
#
# 22
#
# class OrderDetail(models.Model):
#     ordernum=models.ForeignKey(Order)
#     good = models.ForeignKey(Detail)
#     num = models.CharField(max_length=255)




# 订单 模型类
# 一个用户 对应 多个订单 【用户主表， 订单从表(声明关系)】
class Order(models.Model):
    # 用户
    user = models.ForeignKey(UserInfo)
    # 创建时间
    createtime = models.DateTimeField(auto_now_add=True)
    # 状态
    # -1 过期
    # 0 未付款
    # 1 已付款，未发货
    # 2 已付款，已发货， 【快递】
    # 3 已签收，未评价
    # 4 已评价
    status = models.IntegerField(default=0)
    # 订单号
    identifier= models.CharField(max_length=256)


# 订单商品 模型类
# 一个订单 对应 多个商品 【订单主表，订单商品从表(声明关系)】
class OrderGoods(models.Model):
    # 订单
    order = models.ForeignKey(Order)
    # 商品
    goods = models.ForeignKey(Good)
    # 个数
    number = models.IntegerField()  # 1
    # 大小    # XL
    # 颜色    # 白色