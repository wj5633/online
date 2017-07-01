# -*- coding:utf-8 -*-
from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.


class UserProfile(AbstractUser):
    nick_name = models.CharField("昵称", max_length=50, default="")
    birthday = models.DateField("生日", null=True, blank=True)
    gender = models.CharField("性别", max_length=10, choices=(("male", "男"), ("female", "女")), default="female")
    address = models.CharField("地址", max_length=100, default="")
    mobile = models.CharField("手机号", max_length=11, null=True, blank=True)
    image = models.ImageField("头像", upload_to="image/%Y/%m", default="image/default.png", max_length=100)
    openid = models.CharField("微信openid", max_length=100, default="")

    class Meta:
        db_table = "mx_user"
        verbose_name = "用户"
        verbose_name_plural = verbose_name

    def unread_nums(self):
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id).filter(has_read=False).count()

    def __str__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    code = models.CharField("验证码", max_length=20)
    email = models.EmailField("验证邮箱", max_length=50)
    send_type = models.CharField("类型", max_length=20, choices=(("register", "注册"),
                                                               ("forget", "找回密码"),
                                                               ("update_email", "修改邮箱")))
    send_time = models.DateTimeField("发送时间", default=datetime.now)

    class Meta:
        db_table = "mx_verifycode"
        verbose_name = "邮箱验证码"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return '{0}({1})'.format(self.code, self.email)


class Banner(models.Model):
    title = models.CharField("标题", max_length=100)
    image = models.ImageField("轮播图", upload_to="banner/%Y/%m", max_length=100)
    url = models.URLField("访问地址", max_length=200)
    index = models.IntegerField(default=100, verbose_name="顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __unicode__(self):
        return '{0}'.format(self.title)

    class Meta:
        db_table = "mx_banner"
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name
