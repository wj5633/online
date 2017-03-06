# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .models import Course, CourseResource, Video
from operation.models import CourseComments, UserCourse
from utils.mixin_utils import LoginRequireMixin
# Create your views here.
from operation.models import UserFavorite


class CourseView(View):
    """
    课程列表
    """
    def get(self, request):
        all_courses = Course.objects.all().order_by("-add_time")
        # hot_course
        hot_courses = Course.objects.all().order_by("-click_nums")[:3]

        # sort
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_courses = all_courses.order_by("-students")
            elif sort == 'hot':
                all_courses = all_courses.order_by("-click_nums")
        # num
        course_nums = all_courses.count()

        # page
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses, 2, request=request)
        all_courses = p.page(page)
        return render(request, "course-list.html", locals())


class CourseDetailView(View):
    """
    课程详情
    """
    def get(self, request, course_id):
        course = Course.objects.get(id=course_id)
        # 增加点击数
        course.click_nums += 1
        course.save()

        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,
                                           fav_id=course.id, fav_type=1):
                has_fav_course = True

            if UserFavorite.objects.filter(user=request.user,
                                           fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True

        # 相关推荐
        tag = course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:1]
        else:
            relate_courses = Course.objects.all().order_by("-click_nums")[:1]

        return render(request, "course-detail.html", locals())


class CourseInfoView(LoginRequireMixin, View):
    """
    课程章节信息
    """
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        # 查询是否学习该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()

        # 相关课程
        user_coursers = UserCourse.objects.filter(course=course)
        user_ids = [user_courser.user.id for user_courser in user_coursers]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [all_user_course.course.id for all_user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]

        all_resources = CourseResource.objects.filter(course=course)
        return render(request, "course-video.html", locals())


class CommentView(LoginRequireMixin, View):
    """
    课程评论
    """
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        # 相关课程
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [all_user_course.course.id for all_user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]

        all_comments = CourseComments.objects.all()
        return render(request, "course-comment.html", locals())


class AddCommentView(View):
    """
    用户添加评论
    """
    def post(self, request):
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}',
                                content_type='application/json')

        course_id = request.POST.get("course_id", 0)
        comments = request.POST.get("comments", '')
        if course_id > 0 and comments:
            course_comments = CourseComments()
            course = Course.objects.get(id=int(course_id))
            course_comments.course = course
            course_comments.user = request.user
            course_comments.comments = comments
            course_comments.save()
            return HttpResponse('{"status":"success", "msg":"添加成功"}',
                                content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"添加失败"}',
                                content_type='application/json')


class VideoPlayView(LoginRequireMixin, View):
    """
    视频播放
    """
    def get(self, request, video_id):
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course
        course.students += 1
        course.save()
        # 查询是否学习该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()

        # 相关课程
        user_coursers = UserCourse.objects.filter(course=course)
        user_ids = [user_courser.user.id for user_courser in user_coursers]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [all_user_course.course.id for all_user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]

        all_resources = CourseResource.objects.filter(course=course)
        return render(request, "course-play.html", locals())