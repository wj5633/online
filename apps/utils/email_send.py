#!/usr/bin/env python
# -*-coding=utf-8-*-
from random import Random
from django.core.mail import send_mail

from online.settings import EMAIL_FROM
from users.models import EmailVerifyRecord


def send_register_email(email, send_type='register'):
    email_record = EmailVerifyRecord()
    code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    if send_type == "register":
        email_title = "Online在线激活链接"
        email_body = "请点击下面的链接激活你的账号:http://127.0.0.1:8000/active/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            print send_status


def random_str(random_length=8):
    s = ''
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXXYZ"
    length = len(chars) - 1
    random = Random()
    for i in range(random_length):
        s += chars[random.randint(0, length)]
    return s