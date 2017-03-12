#!/usr/bin/env python
# -*-coding=utf-8-*-
import xadmin

from .models import Course, Lesson, Video, CourseResource, BannerCourse
from organization.models import CourseOrg


class LessonInline(object):
    model = Lesson
    extra =0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ('name', 'desc', 'detail', 'degree', 'go_to', 'is_banner', 'get_lesson_nums', 'learn_times', 'students', 'image', 'add_time')
    search_fields = ('name', 'desc', 'degree', 'students')
    list_filter = ('name', 'desc', 'detail', 'degree', 'is_banner', 'learn_times', 'students', 'add_time')
    list_editable = ['degree', 'desc']
    ordering = ['-click_nums']
    readonly_fields = ['click_nums', 'fav_nums']
    exclude = ['fav_nums']
    inlines = [LessonInline, CourseResourceInline]
    refresh_times = [3, 5, 10]
    style_fields = {'detail': 'ueditor'}
    import_excel = True

    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs.filter(is_banner=False)
        return qs

    def save_model(self):
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org)
            course_org.save()

    def post(self, request, *args, **kwargs):
        if 'excel' in request.FILES:
            pass
        return super(CourseAdmin, self).post(request, *args, **kwargs)


class BannerCourseAdmin(object):
    list_display = ('name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'image', 'add_time')
    search_fields = ('name', 'desc', 'degree', 'students')
    list_filter = ('name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'add_time')

    ordering = ['-click_nums']
    readonly_fields = ['click_nums', 'fav_nums']
    exclude = ['fav_nums']
    inlines = [LessonInline, CourseResourceInline]

    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs.filter(is_banner=True)
        return qs


class LessonAdmin(object):
    list_display = ('course', 'name', 'add_time')
    search_fields = ('course__name', 'name')
    list_filter = ('course__name', 'name', 'add_time')


class VideoAdmin(object):
    list_display = ('lesson', 'name', 'add_time')
    search_fields = ('lesson__name', 'name')
    list_filter = ('lesson__name', 'name', 'add_time')


class CourseResourceAdmin(object):
    list_display = ('course', 'name', 'download', 'add_time')
    search_fields = ('course__name', 'name', 'download')
    list_filter = ('course__name', 'name', 'download', 'add_time')

xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)