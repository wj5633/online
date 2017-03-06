#!/usr/bin/env python
# -*-coding=utf-8-*-
from django import forms
from captcha.fields import CaptchaField


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=6)


class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=6)
    captcha = CaptchaField(error_messages={'invalid': "验证码错误!"})


class ForgetForm(forms.Form):
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={'invalid': "验证码错误!"})


class ModifyForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=6)
    password2 = forms.CharField(required=True, min_length=6)