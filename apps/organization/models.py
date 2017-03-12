# -*- coding:utf-8 -*-
from datetime import datetime

from django.db import models

# Create your models here.


class CourseOrg(models.Model):
    city = models.ForeignKey('CityDict', verbose_name="所在城市")
    name = models.CharField(max_length=50, verbose_name="机构名称")
    tag = models.CharField(max_length=10, default='全国知名', verbose_name="机构标签")
    desc = models.TextField(verbose_name="机构描述")
    category = models.CharField('类别',default="pxjg", max_length=20, choices=(
        ("pxjg", "培训机构"), ("gr", "个人"), ("gx", "高校")
    ))
    image = models.ImageField(upload_to="org/%Y/%m", verbose_name="机构图", max_length=100)
    address = models.CharField("机构地址", max_length=150, default="")
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏")
    students = models.IntegerField(default=0, verbose_name="学习人数")
    course_nums = models.IntegerField(default=0, verbose_name="课程数")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_org"
        verbose_name = "课程机构"
        verbose_name_plural = verbose_name

    def get_teacher_nums(self):
        return self.teacher_set.all().count()

    def __unicode__(self):
        return self.name


class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name="城市名称")
    desc = models.CharField(max_length=20, verbose_name="城市藐视")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_city"
        verbose_name = "城市"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name="所属机构")
    name = models.CharField(max_length=50, verbose_name="教师名")
    work_years = models.IntegerField(default=0, verbose_name="工作年限")
    work_company = models.CharField("公司名称", max_length=50)
    work_position = models.CharField("公司职位", max_length=50)
    points = models.CharField("教学特点", max_length=150)
    image = models.ImageField(upload_to="teacher/%Y/%m", verbose_name="头像",default='', max_length=100)
    age = models.IntegerField(default=24, verbose_name="年龄")
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        db_table = "mx_org_teacher"
        verbose_name = "教师"
        verbose_name_plural = verbose_name

    def get_teacher_course_nums(self):
        return self.course_set.count()

    def get_teacher_courses(self):
        return self.course_set.all()

    def __unicode__(self):
        return self.name


