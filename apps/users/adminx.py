#!/usr/bin/env python
# -*-coding=utf-8-*-
import xadmin
from xadmin import views

from users.models import EmailVerifyRecord, UserProfile, Banner


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobelSetting(object):
    site_title = "后台管理系统"
    site_footer = "在线学习网"
    menu_style = "accordion"


class EmailVerifyRecordAdmin(object):
    # 显示字段
    list_display = ('id', 'code', 'email', 'send_type', 'send_time')
    # 搜索
    search_fields = ['code', 'email', 'send_type']
    # 筛选
    list_filter = ('email', 'send_type', 'send_time')


class BannerAdmin(object):
    list_display = ('title', 'image', 'url', 'index', 'add_time')
    search_fields = ('title', 'image', 'url', 'index')
    list_filter = ('title', 'image', 'url', 'index', 'add_time')


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(UserProfile)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobelSetting)