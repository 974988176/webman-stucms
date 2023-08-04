### 项目介绍
本项目是使用php webman admin 开发的学生管理系统
其中，学生管理系统的原仓库地址是：
`
https://github.com/974988176/StudentCMS
`

本仓库对项目进行二开，性能更加强大，代码逻辑清晰，删除原仓库中不易理解的纯SQL语句

添加学生成绩的excel导入

### 项目截图

![总体分析](https://github.com/974988176/webman-stucms/blob/master/snapshots/score-all.jpg?raw=true)

![个人分析](https://github.com/974988176/webman-stucms/blob/master/snapshots/person-analyze.jpg?raw=true)

![成绩查询](https://github.com/974988176/webman-stucms/blob/master/snapshots/score-query.jpg?raw=true)

![菜单管理](https://github.com/974988176/webman-stucms/blob/master/snapshots/menu-manage.jpg?raw=true)

![权限管理](https://github.com/974988176/webman-stucms/blob/master/snapshots/permission-manage.jpg?raw=true)


![代码生成](https://github.com/974988176/webman-stucms/blob/master/snapshots/code-gen.jpg?raw=true)


### 配套毕业论文
请联系作者获取（有偿），备注：毕业论文

QQ: 974988176

WX: lg974988176

### 部署方法
条件：
- php>8.0
- 添加Composer到环境变量
- 添加php到环境变量
> 添加环境变量教程 [添加环境变量](https://jingyan.baidu.com/article/47a29f24610740c0142399ea.html)

下载代码
```
git clone https://github.com/974988176/webman-stucms.git
```
进入项目目录后
- 安装依赖包
```
composer install
```

- 创建数据库`webman-stucms`,数据库文件在项目根目录/数据库文件中
- 复制 .env.example 为 .env
- 配置.env文件中的数据库账户密码

运行：
windows:
```
windows.bat
```

Linux:
```
调试：
php webman start

后台运行：
php webman start -d
```

### 相关文档
webman:
https://www.workerman.net/doc/webman/

webman-admin:
https://www.workerman.net/doc/webman-admin/README.html

layui:
http://layui.org.cn/docs/docs.html


### 演示站点
http://150.158.90.97:8787/
- 管理员账号:admin/admin
- 学生账号:student/123456
