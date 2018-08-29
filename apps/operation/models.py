# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from datetime import datetime

from django.contrib.auth import get_user_model
from django.db import models

from courses.models import Course
from users.models import UserProfile

User = get_user_model()


class UserAsk(models.Model):
    name = models.CharField(max_length=20, verbose_name="姓名")
    mobile = models.CharField(max_length=11, verbose_name="手机号")
    course_name = models.CharField(max_length=50, verbose_name="课程名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_user_ask"
        verbose_name = "用户咨询"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "{0}咨询了{1}".format(self.name, self.course_name)


class CourseComments(models.Model):
    # 课程评论
    user = models.ForeignKey(User, verbose_name="用户名")
    course = models.ForeignKey(Course, verbose_name="课程名")
    comments = models.CharField(max_length=200, verbose_name="评论")

    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_course_comment"
        verbose_name = "课程评论"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "{0}评论了{1}".format(self.user, self.course)


class UserFavorite(models.Model):
    user = models.ForeignKey(User, verbose_name="用户名")
    fav_id = models.IntegerField(default=0, verbose_name="收藏ID")
    fav_type = models.IntegerField(verbose_name="收藏类型",
                                   choices=((1, "课程"), (2, "课程机构"), (3, "讲师")), default=1)
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_course_favorite"
        verbose_name = "用户收藏"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "{0}收藏了{1}:{2}".format(self.user, self.fav_type, self.fav_id)


class UserMessage(models.Model):
    user = models.IntegerField(default=0, verbose_name="用户ID")
    message = models.CharField(max_length=500, verbose_name="消息内容")
    has_read = models.BooleanField(default=False, verbose_name="是否已读")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_course_message"
        verbose_name = "用户消息"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "{0}收到了消息:{1}".format(self.user, self.message)


class UserCourse(models.Model):
    user = models.ForeignKey(User, verbose_name="用户名")
    course = models.ForeignKey(Course, verbose_name="课程名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_course_course"
        verbose_name = "用户课程"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "{0}正在学习{1}".format(self.user, self.course)
