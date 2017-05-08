# -*-coding=utf-8-*-
from __future__ import unicode_literals


from django.conf.urls import url

from online_api_v1.views import BannerList, BannerDetail, banner_list, banner_detail

urlpatterns = {
    # url(r'^banner/$', banner_list, name='banner_list'),
    # url(r'^banner/(?P<id>\d+)$', banner_detail, name='banner_detail'),
    url(r'^banner/$', BannerList.as_view(), name='banner_list'),
    url(r'^banner/(?P<id>\d+)$', BannerDetail.as_view(), name='banner_detail'),
}
