from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import generics

from online_api_v1.serializers import BannerSerializer
from users.models import Banner


class JSONResponse(HttpResponse):
    def __init__(self, data, **kwargs):
        print data
        content = JSONRenderer().render(data)
        print content
        kwargs['content_type'] = 'application/json; charset=utf-8'
        super(JSONResponse, self).__init__(content, **kwargs)


def banner_list(request):
    """
    BannerList
    """
    if request.method == 'GET':
        banners = Banner.objects.all()
        print banners
        ser = BannerSerializer(banners, many=True)
        print ser.data
        return JSONResponse(ser.data)


def banner_detail(request, id):

    try:
        banner = Banner.objects.get(id=id)
    except Banner.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        ser = BannerSerializer(banner)
        return JSONRenderer(ser.data)


# class BannerList(APIView):
#     def get(self, request, format=None):
#         banners = Banner.objects.all()
#         ser = BannerSerializer(banners, many=True)
#         return Response(ser.data)
#
#     def post(self, request, format=None):
#         ser = BannerSerializer(request.DATA)
#         if ser.is_valid():
#             ser.save()
#             return Response(ser.data)
#         return Response(ser.errors)


# class BannerDetail(APIView):
#     def get(self, request, id, format=None):
#         banner = Banner.objects.get(id=id)
#         ser = BannerSerializer(banner)
#         return Response(ser.data)


class BannerList(generics.ListCreateAPIView):
    queryset = Banner.objects.all()
    serializer_class = BannerSerializer


class BannerDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Banner.objects.all()
    serializer_class = BannerSerializer
