# -*-coding=utf-8-*-
from __future__ import unicode_literals

from django.conf.urls import url
from rest_framework.routers import DefaultRouter
from rest_framework_swagger.views import get_swagger_view

from online_api_v1.views import SwaggerSchemaView, BannerViewSet, UserProfileViewSet, CourseViewSet, \
    BannerCourseViewSet, LessonViewSet, VideoViewSet, CourseResourceViewSet, UserAskViewSet, CourseCommentsViewSet, \
    UserFavoriteViewSet, UserMessageViewSet, UserCourseViewSet, TeacherViewSet, CityDictViewSet, CourseOrgViewSet

schema_view = get_swagger_view(title='Online API V1')

router = DefaultRouter()

router.register(prefix='banners', viewset=BannerViewSet, base_name='banners')
router.register(prefix='users', viewset=UserProfileViewSet, base_name='users')
router.register(prefix='courses', viewset=CourseViewSet, base_name='courses')
router.register(prefix='orgs', viewset=CourseOrgViewSet, base_name='orgs')
router.register(prefix='course_banner', viewset=BannerCourseViewSet, base_name='course_banner')
router.register(prefix='city', viewset=CityDictViewSet, base_name='city')
router.register(prefix='teachers', viewset=TeacherViewSet, base_name='teachers')
router.register(prefix='user_ask', viewset=UserAskViewSet, base_name='user_ask')
router.register(prefix='course_comment', viewset=CourseCommentsViewSet, base_name='course_comment')
router.register(prefix='user_message', viewset=UserMessageViewSet, base_name='user_message')
router.register(prefix='user_favorite', viewset=UserFavoriteViewSet, base_name='user_favorite')
router.register(prefix='user_course', viewset=UserCourseViewSet, base_name='user_course')
router.register(prefix='course_resource', viewset=CourseResourceViewSet, base_name='course_resource')
router.register(prefix='videos', viewset=VideoViewSet, base_name='videos')
router.register(prefix='lessons', viewset=LessonViewSet, base_name='lessons')

urlpatterns = router.urls

urlpatterns += {
    url(r'^docs/$', SwaggerSchemaView.as_view()),
}
