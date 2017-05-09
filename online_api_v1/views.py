# -*-coding:utf-8-*-
from __future__ import unicode_literals
from django.http import HttpResponse

# Create your views here.
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import viewsets
from rest_framework.permissions import AllowAny
from rest_framework.schemas import SchemaGenerator
from rest_framework_swagger import renderers

from online_api_v1.serializers import BannerSerializer, BannerCourseSerializer, CityDictSerializer, \
    CourseCommentsSerializer, CourseOrgSerializer, CourseResourceSerializer, CourseSerializer, UserAskSerializer, \
    TeacherSerializer, UserCourseSerializer, UserFavoriteSerializer, UserMessageSerializer, UserProfileSerializer, \
    LessonSerializer, VideoSerializer

from users.models import Banner, UserProfile
from courses.models import Course, BannerCourse, Lesson, Video, CourseResource
from operation.models import UserAsk, CourseComments, UserFavorite, UserMessage, UserCourse
from organization.models import CourseOrg, CityDict, Teacher


class JSONResponse(HttpResponse):
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json; charset=utf-8'
        super(JSONResponse, self).__init__(content, **kwargs)


class SwaggerSchemaView(APIView):
    permission_classes = [AllowAny]
    renderer_classes = [
        renderers.OpenAPIRenderer,
        renderers.SwaggerUIRenderer
    ]

    def get(self, request):
        generator = SchemaGenerator()
        schema = generator.get_schema(request=request)

        return Response(schema)


class BannerViewSet(viewsets.ModelViewSet):
    """
    首页Banner图
    """
    queryset = Banner.objects.all()
    serializer_class = BannerSerializer


class UserProfileViewSet(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer


class CourseViewSet(viewsets.ModelViewSet):
    queryset = Course.objects.all()
    serializer_class = CourseSerializer


class BannerCourseViewSet(viewsets.ModelViewSet):
    queryset = BannerCourse.objects.all()
    serializer_class = BannerCourseSerializer


class LessonViewSet(viewsets.ModelViewSet):
    queryset = Lesson.objects.all()
    serializer_class = LessonSerializer


class VideoViewSet(viewsets.ModelViewSet):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer


class CourseResourceViewSet(viewsets.ModelViewSet):
    queryset = CourseResource.objects.all()
    serializer_class = CourseResourceSerializer


class UserAskViewSet(viewsets.ModelViewSet):
    queryset = UserAsk.objects.all()
    serializer_class = UserAskSerializer


class CourseCommentsViewSet(viewsets.ModelViewSet):
    queryset = CourseComments.objects.all()
    serializer_class = CourseCommentsSerializer


class UserFavoriteViewSet(viewsets.ModelViewSet):
    queryset = UserFavorite.objects.all()
    serializer_class = UserFavoriteSerializer


class UserMessageViewSet(viewsets.ModelViewSet):
    queryset = UserMessage.objects.all()
    serializer_class = UserMessageSerializer


class UserCourseViewSet(viewsets.ModelViewSet):
    queryset = UserCourse.objects.all()
    serializer_class = UserCourseSerializer


class TeacherViewSet(viewsets.ModelViewSet):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer


class CityDictViewSet(viewsets.ModelViewSet):
    queryset = CityDict.objects.all()
    serializer_class = CityDictSerializer


class CourseOrgViewSet(viewsets.ModelViewSet):
    queryset = CourseOrg.objects.all()
    serializer_class = CourseOrgSerializer
