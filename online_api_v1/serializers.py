# -*-coding=utf-8-*-
from __future__ import unicode_literals

from users.models import Banner, UserProfile
from rest_framework import serializers
from courses.models import Course, BannerCourse, Lesson, Video, CourseResource
from operation.models import UserAsk, CourseComments, UserFavorite, UserMessage, UserCourse
from organization.models import CourseOrg, CityDict, Teacher


class BannerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Banner
        fields = '__all__'


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = '__all__'


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'


class BannerCourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = BannerCourse
        fields = '__all__'


class LessonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lesson
        fields = '__all__'


class VideoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Video
        fields = '__all__'


class CourseResourceSerializer(serializers.ModelSerializer):
    class Meta:
        model = CourseResource
        fields = '__all__'


class UserAskSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserAsk
        fields = '__all__'


class CourseCommentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = CourseComments
        fields = '__all__'


class UserFavoriteSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserFavorite
        fields = '__all__'


class UserMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserMessage
        fields = '__all__'


class UserCourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserCourse
        fields = '__all__'


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'


class CityDictSerializer(serializers.ModelSerializer):
    class Meta:
        model = CityDict
        fields = '__all__'


class CourseOrgSerializer(serializers.ModelSerializer):
    class Meta:
        model = CourseOrg
        fields = '__all__'
