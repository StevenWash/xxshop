# XXShop

## Introduce
这是一个基于Spring+Struts+Mybatis的B2C电子商务网站，以销售电子类产品为主要原型。
可以通过在后台登录之后的界面添加相应的商品类别来扩展为任意的B2C网站。

## Resource

所有的代码文件都在src目录下，主要包括的就是java、Resource两个目录，在java目录下，
主要就是以下的结构：

 - dao（所有的数据库操作，基于Mybatis实现）
 - entity（所有的实体类信息，POJO）
 - service（所有的系统服务都，主要有Spring就行事务的管理）
 - util（工具包）
 - web（主要是作为前端控制器，由struts实现）
 
在resource目录下的文件结构如下：

 - mysql/xxshop.sql（存放创建数据库的sql文件，并且包含了相关的数据）
 - db.properties（存放的是数据库的配置文件）
 - log4j.properties（存放的是日志的配置文件）
 - mybatis-config.xml（存放的是mybatis关于数据库的配置文件）
 
## Quick Start

直接使用git将代码clone到本地：
```
git clone https://github.com/StevenWash/xxshop.git
```
然后将项目直接用Maven项目导入到IDEA中，等待依赖包的下载，在resource目录下找到xxshop.sql文件，将其导入到自己
本地的数据库中。

在本地的数据库创建完成之后，在db.properties中将相关的信息修改为自己的数据库的相关
信息即可。

## Thanks

[CSDN博客](http://blog.csdn.net/hx0624_csdn)
QQ : 862863758

