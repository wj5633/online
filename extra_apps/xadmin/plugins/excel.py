#!/usr/bin/env python
# -*-coding=utf-8-*-
from __future__ import unicode_literals

from django.template import loader

import xadmin
from xadmin.views import BaseAdminPlugin
from xadmin.views import ListAdminView

__author__ = 'wj'


# excel导入
class ListImportExcelPlugin(BaseAdminPlugin):
    import_excel = True

    def init_request(self, *args, **kwargs):
        return bool(self.import_excel)

    def block_top_toolbar(self, context, nodes):
        nodes.append(loader.render_to_string('xadmin/excel/model_list.top_toolbar.import.html',
                                             context_instance=context))


xadmin.site.register_plugin(ListImportExcelPlugin, ListAdminView)