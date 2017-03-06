#!/usr/bin/env python
# -*-coding=utf-8-*-
from __future__ import unicode_literals
import re
from django import forms

from operation.models import UserAsk


# modelform
class UserAskForm(forms.ModelForm):
    # name = forms.CharField(requires=True, min_length=2, max_length=20)
    # mobile = forms.CharField(requires=True, min_length=11, max_length=11)
    # course_name = forms.CharField(requires=True, min_length=5, max_length=50)

    class Meta:
        model = UserAsk
        fields = ['name', 'mobile', 'course_name']

    def clean_mobile(self):
        # 手机号验证
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^1[358]\d{9}$|^147\d{8}$|^176\d{8}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            # 验证成功,返回字段
            return mobile
        else:
            # 验证失败,返回错误信息
            return forms.ValidationError("非法手机号码", code="mobile_invalid")