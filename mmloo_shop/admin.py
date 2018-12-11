from django.contrib import admin

# Register your models here.
from mmloo_shop.models import UserInfo, Lunbo


class UserInfoAdmin(admin.ModelAdmin):
    list_display = ['db_utel']

admin.site.register(UserInfo,UserInfoAdmin)



class LunboAdmin(admin.ModelAdmin):
    list_display = ['db_img_detail','db_img_firsttime','db_img_lasttime','db_img']

admin.site.register(Lunbo,LunboAdmin)