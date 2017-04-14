# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2017-04-14 04:48
from __future__ import unicode_literals

import datetime
import django.contrib.auth.models
import django.core.validators
from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0007_alter_validators_add_error_messages'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=30, unique=True, validators=[django.core.validators.RegexValidator('^[\\w.@+-]+$', 'Enter a valid username. This value may contain only letters, numbers and @/./+/-/_ characters.')], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=30, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('nick_name', models.CharField(default=b'', max_length=50, verbose_name=b'\xe6\x98\xb5\xe7\xa7\xb0')),
                ('birthday', models.DateField(blank=True, null=True, verbose_name=b'\xe7\x94\x9f\xe6\x97\xa5')),
                ('gender', models.CharField(choices=[(b'male', b'\xe7\x94\xb7'), (b'female', b'\xe5\xa5\xb3')], default=b'female', max_length=10, verbose_name=b'\xe6\x80\xa7\xe5\x88\xab')),
                ('address', models.CharField(default=b'', max_length=100, verbose_name=b'\xe5\x9c\xb0\xe5\x9d\x80')),
                ('mobile', models.CharField(blank=True, max_length=11, null=True, verbose_name=b'\xe6\x89\x8b\xe6\x9c\xba\xe5\x8f\xb7')),
                ('image', models.ImageField(default=b'image/default.png', upload_to=b'image/%Y/%m', verbose_name=b'\xe5\xa4\xb4\xe5\x83\x8f')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'db_table': 'mx_user',
                'verbose_name': '\u7528\u6237',
                'verbose_name_plural': '\u7528\u6237',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Banner',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, verbose_name=b'\xe6\xa0\x87\xe9\xa2\x98')),
                ('image', models.ImageField(upload_to=b'banner/%Y/%m', verbose_name=b'\xe8\xbd\xae\xe6\x92\xad\xe5\x9b\xbe')),
                ('url', models.URLField(verbose_name=b'\xe8\xae\xbf\xe9\x97\xae\xe5\x9c\xb0\xe5\x9d\x80')),
                ('index', models.IntegerField(default=100, verbose_name=b'\xe9\xa1\xba\xe5\xba\x8f')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name=b'\xe6\xb7\xbb\xe5\x8a\xa0\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'db_table': 'mx_banner',
                'verbose_name': '\u8f6e\u64ad\u56fe',
                'verbose_name_plural': '\u8f6e\u64ad\u56fe',
            },
        ),
        migrations.CreateModel(
            name='EmailVerifyRecord',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=20, verbose_name=b'\xe9\xaa\x8c\xe8\xaf\x81\xe7\xa0\x81')),
                ('email', models.EmailField(max_length=50, verbose_name=b'\xe9\xaa\x8c\xe8\xaf\x81\xe9\x82\xae\xe7\xae\xb1')),
                ('send_type', models.CharField(choices=[(b'register', b'\xe6\xb3\xa8\xe5\x86\x8c'), (b'forget', b'\xe6\x89\xbe\xe5\x9b\x9e\xe5\xaf\x86\xe7\xa0\x81'), (b'update_email', b'\xe4\xbf\xae\xe6\x94\xb9\xe9\x82\xae\xe7\xae\xb1')], max_length=20, verbose_name=b'\xe7\xb1\xbb\xe5\x9e\x8b')),
                ('send_time', models.DateTimeField(default=datetime.datetime.now, verbose_name=b'\xe5\x8f\x91\xe9\x80\x81\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'db_table': 'mx_verifycode',
                'verbose_name': '\u90ae\u7bb1\u9a8c\u8bc1\u7801',
                'verbose_name_plural': '\u90ae\u7bb1\u9a8c\u8bc1\u7801',
            },
        ),
    ]