# luci_driver

luci_driver

## 开发技能点
### Todo：网络访问
1. 下载json文件
2. APP基本架构
// https://www.youtube.com/watch?v=CDt_r9LrdeU&list=PLeE38-H82SvgQxnfJGmvDfPIFfQp2U3tU&index=17

1. 解释时间格式
https://androidkt.com/format-datetime-in-flutter/

- 使用Dart 做后端语言
https://dart.dev/tutorials/server/httpserver


- 后端框架 和 教程
https://aqueduct.io/ 
https://juejin.im/search?query=Aqueduct&type=all
## 项目计划


### 1. Nav Router (Done)

### 2. 核心页面
#### 2.1 Login Page

###### Done: model
1.创建user model
2.填仿真数据（2个用户）

##### Done：info code model
定义通信code
101 成功
102 没有该用户
103 密码错误
104 其他错误


##### Todo：数据本地化
登陆成功后，讲基本的用户信息，保存到本地。
4.1 登陆成功的token，暂时用某一固定id代替
4.2 用户ID、用户姓名



#### 2.2 HomePage
##### 资料
- https://github.com/CoolONEOfficial/ranepa_timetable 它的时间表，可以参考
- https://codelabs.flutter-io.cn/codelabs/first-flutter-app-pt1-cn/index.html#0
- https://medium.com/@diegoveloper/flutter-fetching-parsing-json-data-c019ddddaa34
  


##### Todo：Homepage   
- listview 


#### 2.3 订单详情页

##### Todo：OrderDetail 页面
- OrderDetail

##### Todo：OrderMap 页面

- map
     看官方文档，主要实现导航
     
     
###  1.3 非核心页面

#### 1） MyOrders

##### Todo：实现tab功能

##### Todo：根据订单状态显示2个订单列表

#### 2） MyProfile

#### 3） menu

##### Todo：实现退出功能

#### 4） ForgetPassword

#### 5） ForgetPasswordResult

### 1.4 Back End Work
#### Todo：order model

##### 增加可以根据date 过滤订单
##### 根据订单状态过滤订单


##### Todo：登陆控制
1.根据email，查询用户，并返回结果
1.1 找到该用户，继续下一步
1.2 没有找到用户，报错

2.根据email，对填写pw 和正确对pw做校验
2.1 成功，返回 1
2.2 失败，返回2

## Next To
#### Todo：登陆控制
5. 启动APP时，首先检查本地是否存在登陆token
5.1 如果有，直接去首页
5.2 如果没有，进入登陆页


