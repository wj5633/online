#!/usr/bin/env python
# -*-coding=utf-8-*-
from __future__ import unicode_literals

__author__ = 'wj'

# 第一步
# pip install DjangoUeditor
# settings.py中加入DjangoUeditor
# url(r'ueditor/', include('DjangoUeditor.urls'))
# 字段detail = UEditorField()

# 第二步
# plugins中添加ueditor.py, 在__init__中加入ueditor
# adminx中添加style_fields = {'detail': 'ueditor'}
