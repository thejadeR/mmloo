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
        db_table = 'mml_userinfos'



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
        db_table = 'mml_lunbos'


class Good(models.Model):
    good_img = models.CharField(max_length=100)
    good_detail = models.CharField(max_length=100)
    good_price = models.DecimalField(max_digits=10,decimal_places=2)
    market_price = models.DecimalField(max_digits=10, decimal_places=2)
    trackid = models.CharField(max_length=20)
    def __str__(self):
        return self.good_img
    class Meta:
        db_table = 'mml_goods'



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
#     price = models.CharField(max_length=50)
#     mbbprice = models.CharField(max_length=50)
#     unit = models.CharField(max_length=20)
#     heading = models.CharField(max_length=255)
#     picnum=models.CharField(max_length=255)
#     pic1 = models.CharField(max_length=255)
#     pic2 = models.CharField(max_length=255)
#     pic3 = models.CharField(max_length=255)
#     pic4 = models.CharField(max_length=255)
#     pic5 = models.CharField(max_length=255)
#     pic6 = models.CharField(max_length=255)
#
#     def __str__(self):
#         return self.name
#
# class Text(models.Model):
#     str=HTMLField()
#
#
# class Cart(models.Model):
#     user=models.ForeignKey(User)
#     good = models.ForeignKey(Detail)
#     num = models.IntegerField()
#     isselect = models.BooleanField(default=True)
#
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