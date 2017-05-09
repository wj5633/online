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

router.register(prefix='banners', viewset=BannerViewSet)
router.register(prefix='users', viewset=UserProfileViewSet)
router.register(prefix='courses', viewset=CourseViewSet)
router.register(prefix='orgs', viewset=CourseOrgViewSet)
router.register(prefix='course_banner', viewset=BannerCourseViewSet)
router.register(prefix='city', viewset=CityDictViewSet)
router.register(prefix='teachers', viewset=TeacherViewSet)
router.register(prefix='user_ask', viewset=UserAskViewSet)
router.register(prefix='course_comment', viewset=CourseCommentsViewSet)
router.register(prefix='user_message', viewset=UserMessageViewSet)
router.register(prefix='user_favorite', viewset=UserFavoriteViewSet)
router.register(prefix='user_course', viewset=UserCourseViewSet)
router.register(prefix='course_resource', viewset=CourseResourceViewSet)
router.register(prefix='vidoes', viewset=VideoViewSet)
router.register(prefix='lessons', viewset=LessonViewSet)

urlpatterns = router.urls

urlpatterns += {
    url(r'^docs/$', SwaggerSchemaView.as_view()),
}
