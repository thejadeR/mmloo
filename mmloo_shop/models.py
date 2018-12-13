from django.db import models


# Create your models here.
class UserInfo(models.Model):
    # import random
    # unum = random.randint(0,100000000)
    # db_uname = models.CharField(max_length=40,unique=True,default='用户{}'.format(unum))
    # 头像
    db_headimg = models.CharField(max_length=150, default='person.png')

    db_utel = models.CharField(max_length=20,unique=True)
    db_upassword = models.CharField(max_length=256)


    db_token = models.CharField(max_length=256,default='')

    # 创建时间
    db_uFirstTime = models.DateTimeField(auto_now=True)
    # 最后修改时间
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

    # 3所属分类再再上一层分类
    good_fffarther = models.CharField(max_length=15,default='')
    # 2所属分类再上一层分类
    good_ffarther = models.CharField(max_length=15, default='')
    # 1商品所属分类
    good_farther = models.CharField(max_length=15, default='')

    # 商品名字
    good_detail = models.CharField(max_length=100)
    # 商品说明
    good_explain = models.CharField(max_length=255,default='')

    # 批发价
    good_price = models.DecimalField(max_digits=10,decimal_places=2)
    # 零售价
    market_price = models.DecimalField(max_digits=10, decimal_places=2)
    # 商品编号
    goodid = models.IntegerField(default=1)

    # 评论条数
    good_comment = models.IntegerField(default=0)
    # 运费
    good_freight = models.DecimalField(max_digits=10,decimal_places=2)
    def __str__(self):
        return self.good_detail
    class Meta:
        db_table = 'mmloo_goods'



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