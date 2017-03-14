# online

### python环境
- python == 2.7.13
- django == 1.9.5
### mysql环境
- mysql wangjie@localhost/123456
- mysql -uwangjie -p123456 online <online.sql
### 安装启动
- pip install -r requirements.txt
- python manage.py runserver 
### nginx+uwsgi启动
- cd ~/online
- ln -c conf/mx_nginx.conf /etc/ /etc/nginx/conf.d
- uwsgi -i conf/mx_uwsgi.ini