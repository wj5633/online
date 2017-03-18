#!/usr/bin/env python
# -*-coding=utf-8-*-
from __future__ import unicode_literals

from random import Random

from django.core.mail import send_mail

from online.settings import EMAIL_FROM, SITE_NAME
from users.models import EmailVerifyRecord

from online.celery_ag import app


@app.task
def send_register_email(email, send_type='register'):
    email_record = EmailVerifyRecord()
    if send_type == "update_email":
        code = random_str(4)
    else:
        code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    if send_type == "register":
        email_title = "Online在线激活链接"
        email_body = "请点击下面的链接激活你的账号:http://{0}/active/{1}".format(SITE_NAME, code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == 'forget':
        email_title = "Online重置密码链接"
        email_body = "请点击下面的链接重置密码:http://{0}/reset/{1}".format(SITE_NAME, code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == "update_email":
        email_title = "Online修改邮箱链接"
        email_body = "你的邮箱验证码为:{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass


def random_str(random_length=8):
    s = ''
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXXYZ"
    length = len(chars) - 1
    random = Random()
    for i in range(random_length):
        s += chars[random.randint(0, length)]
    return s