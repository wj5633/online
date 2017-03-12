# -*- coding:utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime

from DjangoUeditor.models import UEditorField
from django.db import models
from organization.models import CourseOrg, Teacher


# Create your models here.


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg, verbose_name="课程机构", null=True, blank=True)
    teacher = models.ForeignKey(Teacher, verbose_name="课程讲师", null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name="课程名")
    desc = models.CharField(max_length=300, verbose_name="课程描述")
    detail = UEditorField('课程详情', width=600, height=300, toolbars="full", imagePath="course/ueditor/",
                          filePath="course/ueditor/", upload_settings={"imageMaxSize": 1204000}, settings={},
                          command=None, event_handler='', blank=True, default="")
    category = models.CharField("课程类别", max_length=20, default="Python")
    degree = models.CharField("难度", choices=(("cj", "初级"), ("zj", "中级"), ("gj", "高级")),
                              max_length=5)
    is_banner = models.BooleanField(default=False, verbose_name="是否是轮播图")
    learn_times = models.IntegerField(default=0, verbose_name="时长")
    students = models.IntegerField(default=0, verbose_name="学习人数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏")
    image = models.ImageField(upload_to="courses/%Y/%m", verbose_name="封面图", max_length=100)
    tag = models.CharField(default="", verbose_name="课程标签", max_length=10)
    know = models.CharField(default="", verbose_name="课程须知", max_length=300)
    teacher_tell = models.CharField(default="", verbose_name="学到什么", max_length=300)

    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_course"
        verbose_name = "课程"
        verbose_name_plural = verbose_name

    def get_lesson_nums(self):
        return self.lesson_set.all().count()
    get_lesson_nums.short_description = "章节数"

    def get_learn_users(self):
        return self.usercourse_set.all()[:5]

    def get_course_lesson(self):
        # 获取所以章节
        return self.lesson_set.all()

    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href='http://www.baidu.com'>跳转</a>")
    go_to.short_description = "跳转"

    def __unicode__(self):
        return self.name


class BannerCourse(Course):
    db_table = "mx_course_banner"
    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name
        proxy = True # 不生成表


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name="课程")
    name = models.CharField(max_length=100, verbose_name="章节名称")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_course_lesson"
        verbose_name = "章节"
        verbose_name_plural = verbose_name

    def get_lesson_video(self):
        # 获取章节视频
        return self.video_set.all()

    def __unicode__(self):
        return self.name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name="章节")
    name = models.CharField(max_length=100, verbose_name="视频名")
    url = models.CharField("访问地址",default="", max_length=200)
    learn_times = models.IntegerField(default=1.2, verbose_name="时长")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_course_video"
        verbose_name = "视频"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name="课程")
    name = models.CharField(max_length=100, verbose_name="名称")
    download = models.FileField(upload_to="courses/resource/%Y/%m", verbose_name="资源名", max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_course_resource"
        verbose_name = "资源"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name
