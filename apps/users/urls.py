#!/usr/bin/env python
# -*-coding=utf-8-*-


from django.conf.urls import url
from .views import UserInfoView, UploadImageView, UpdataPwdView, MyFavOrgView, MyFavTeacherView, MyFavCourseView, \
    MyMassageView
from .views import SendEmailCodeView, UpdateEmailView, MyCourseView

urlpatterns = [
    # organization
    url(r'^info/$', UserInfoView.as_view(), name='user_info'),

    url(r'^image/upload/$', UploadImageView.as_view(), name='image_upload'),

    url(r'^update/pwd/$', UpdataPwdView.as_view(), name='update_pwd'),

    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name='sendmail_code'),

    url(r'^update_email/$', UpdateEmailView.as_view(), name='update_email'),

    url(r'^mycourse/$', MyCourseView.as_view(), name='mycourse'),

    url(r'^myfav/org/$', MyFavOrgView.as_view(), name='myfav_org'),
    url(r'^myfav/teacher/$', MyFavTeacherView.as_view(), name='myfav_teacher'),
    url(r'^myfav/course/$', MyFavCourseView.as_view(), name='myfav_course'),

    url(r'^mymessage/$', MyMassageView.as_view(), name='mymessage'),

]
