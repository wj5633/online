#!/usr/bin/env python
# -*-coding=utf-8-*-
import xadmin

from .models import CourseOrg, CityDict, Teacher


class CourseOrgAdmin(object):
    list_display = ('name', 'city', 'desc', 'image', 'address', 'add_time')
    search_fields = ('name', 'city', 'desc', 'image', 'address')
    list_filter = ('name', 'city', 'desc', 'image', 'address', 'add_time')

    relfield_style = 'fk-ajax'


class CityDictAdmin(object):
    list_display = ('name', 'desc', 'add_time')
    search_fields = ('name', 'desc')
    list_filter = ('name', 'desc', 'add_time')


class TeacherAdmin(object):
    list_display = ('name', 'org', 'work_years', 'work_company', 'add_time')
    search_fields = ('name', 'org', 'work_years', 'work_company')
    list_filter = ('name', 'org', 'work_years', 'work_company', 'add_time')

xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(Teacher, TeacherAdmin)