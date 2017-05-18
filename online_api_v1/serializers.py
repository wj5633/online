# -*-coding=utf-8-*-
from __future__ import unicode_literals

from users.models import Banner, UserProfile
from rest_framework import serializers
from courses.models import Course, BannerCourse, Lesson, Video, CourseResource
from operation.models import UserAsk, CourseComments, UserFavorite, UserMessage, UserCourse
from organization.models import CourseOrg, CityDict, Teacher


class BannerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Banner
        fields = '__all__'


class UserProfileSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = UserProfile
        fields = '__all__'


class CourseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'


class BannerCourseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = BannerCourse
        fields = '__all__'


class LessonSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Lesson
        fields = '__all__'


class VideoSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Video
        fields = '__all__'


class CourseResourceSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = CourseResource
        fields = '__all__'


class UserAskSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = UserAsk
        fields = '__all__'


class CourseCommentsSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = CourseComments
        fields = '__all__'


class UserFavoriteSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = UserFavorite
        fields = '__all__'


class UserMessageSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = UserMessage
        fields = '__all__'


class UserCourseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = UserCourse
        fields = '__all__'


class TeacherSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'


class CityDictSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = CityDict
        fields = '__all__'


class CourseOrgSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = CourseOrg
        fields = '__all__'
