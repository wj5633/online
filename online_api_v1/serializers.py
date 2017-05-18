# -*-coding=utf-8-*-
from __future__ import unicode_literals

from users.models import Banner, UserProfile
from rest_framework import serializers
from courses.models import Course, BannerCourse, Lesson, Video, CourseResource
from operation.models import UserAsk, CourseComments, UserFavorite, UserMessage, UserCourse
from organization.models import CourseOrg, CityDict, Teacher


class BannerSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:banners-detail',
        lookup_field='pk'
    )

    class Meta:
        model = Banner
        fields = '__all__'


class UserProfileSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:users-detail',
        lookup_field='pk'
    )

    class Meta:
        model = UserProfile
        fields = (
            'url', 'username', 'password', 'email', 'nick_name', 'birthday', 'gender', 'address', 'mobile', 'image')
        depth = 1


class CityDictSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:city-detail',
        lookup_field='pk'
    )

    class Meta:
        model = CityDict
        fields = '__all__'
        depth = 1


class CourseOrgSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:orgs-detail',
        lookup_field='pk'
    )

    city = CityDictSerializer()

    class Meta:
        model = CourseOrg
        fields = '__all__'
        depth = 1


class TeacherSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:teachers-detail',
        lookup_field='pk'
    )

    org = CourseOrgSerializer()

    class Meta:
        model = Teacher
        fields = '__all__'
        depth = 1


class CourseSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:courses-detail',
        lookup_field='pk'
    )
    course_org = CourseOrgSerializer()

    teacher = TeacherSerializer()

    class Meta:
        model = Course
        fields = '__all__'
        depth = 1


class BannerCourseSerializer(CourseSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:courses-detail',
        lookup_field='pk'
    )
    course_org = CourseOrgSerializer()

    teacher = TeacherSerializer()

    class Meta:
        model = BannerCourse
        fields = '__all__'
        depth = 1


class LessonSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:lessons-detail',
        lookup_field='pk'
    )

    course = CourseSerializer()

    class Meta:
        model = Lesson
        fields = '__all__'
        depth = 1


class VideoSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:videos-detail',
        lookup_field='pk'
    )

    lesson = LessonSerializer()

    class Meta:
        model = Video
        fields = '__all__'
        depth = 1


class CourseResourceSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:course_resource-detail',
        lookup_field='pk'
    )
    course = CourseSerializer()

    class Meta:
        model = CourseResource
        fields = '__all__'
        depth = 1


class UserAskSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:user_ask-detail',
        lookup_field='pk'
    )

    class Meta:
        model = UserAsk
        fields = '__all__'
        depth = 1


class CourseCommentsSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:course_comment-detail',
        lookup_field='pk'
    )

    user = UserProfileSerializer()

    course = CourseSerializer()

    class Meta:
        model = CourseComments
        fields = '__all__'
        depth = 1


class UserFavoriteSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:user_favorite-detail',
        lookup_field='pk'
    )
    user = UserProfileSerializer()

    class Meta:
        model = UserFavorite
        fields = '__all__'
        depth = 1


class UserMessageSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:user_message-detail',
        lookup_field='pk'
    )

    class Meta:
        model = UserMessage
        fields = '__all__'
        depth = 1


class UserCourseSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(
        view_name='api_v1:user_course-detail',
        lookup_field='pk'
    )
    user = UserProfileSerializer()
    course = CourseSerializer()

    class Meta:
        model = UserCourse
        fields = '__all__'
        depth = 1
