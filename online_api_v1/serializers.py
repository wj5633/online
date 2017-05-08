# -*-coding=utf-8-*-
from __future__ import unicode_literals

from users.models import Banner
from rest_framework import serializers


class BannerSerializer(serializers.Serializer):

    class Meta:
        model = Banner
        field = ('id', 'title', 'image', 'url', 'index', 'add_time')
    # title = serializers.CharField(max_length=100)
    # image = serializers.ImageField(max_length=100)
    # url = serializers.URLField(max_length=200)
    # index = serializers.IntegerField()
    # add_time = serializers.DateTimeField()

    def create(self, validated_data):
        pass

    def update(self, instance, validated_data):
        pass

    def restore_object(self, attrs, instance=None):
        if instance:
            instance.title = attrs['title']
            instance.image = attrs['image']
            instance.url = attrs['url']
            instance.index = attrs['index']
            instance.add_time = attrs['add_time']
            return instance
        return Banner(**attrs)