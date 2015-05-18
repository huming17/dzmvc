/*
* @DEBUG create @ 20130113
*/


编码 UTF-8

一、安装环境要求
	Windows/*inux
	PHP 5.2.6以上
	MYSQL 5.1 以上
	Apache 1.3.2 / Nginx 0.9 以上

二、开发程序编码 UTF-8

三、SVN目录简单说明:

+ parentController
  - readme	 说明文件
  - admin.php	 后台入口文件
  - index.php    前台入口文件
  - .htaccess    伪静态文件
  + config       配置文件目录
  + source       业务代码逻辑目录
  + plugins	     扩展插件目录
  + dz_framework 框架代码目录
  + template     模版目录 默认放default目录,后续有多样式切换需求的话,再新建新模版目录
  + install      安装目录
  + data         程序运行产生的文件目录（如日志、上传文件、缓存数据等）

change log:
2015-05-14 增加ACE后台皮肤