#!/usr/bin/env python
# -*-coding=utf-8-*-
from __future__ import unicode_literals
import xadmin
from xadmin.layout import Fieldset, Main, Row, Side
from xadmin.plugins.auth import UserAdmin
from django.utils.translation import ugettext as _
from xadmin import views

from users.models import EmailVerifyRecord, UserProfile, Banner


class UserProfileAdmin(UserAdmin):
    def get_form_layout(self):
        if self.org_obj:
            self.form_layout = (
                Main(
                    Fieldset('',
                             'username', 'password',
                             css_class='unsort no_title'
                             ),
                    Fieldset(_('Personal info'),
                             Row('first_name', 'last_name'),
                             'email'
                             ),
                    Fieldset(_('Permissions'),
                             'groups', 'user_permissions'
                             ),
                    Fieldset(_('Important dates'),
                             'last_login', 'date_joined'
                             ),
                ),
                Side(
                    Fieldset(_('Status'),
                             'is_active', 'is_staff', 'is_superuser',
                             ),
                )
            )
        return super(UserAdmin, self).get_form_layout()


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

# from django.contrib.auth.models import User
# xadmin.site.unregister(User)

xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
# xadmin.site.register(UserProfile, UserProfileAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobelSetting)