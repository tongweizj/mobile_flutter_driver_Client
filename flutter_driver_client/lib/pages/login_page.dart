import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luci_driver/pages/home_page.dart';
import 'package:luci_driver/model/user.dart';
import 'package:luci_driver/utils/http.dart';
import 'package:luci_driver/widget/login_lib.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  //LoginPage({Key key, this.title}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // 页头标题


    // 忘记密码按钮
    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    // 前端页面
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            headerBox(),
            SizedBox(height: 48.0), // 类似DIV 空box盒子，只是用来占位置
            LoginForm(), //登陆信息填写表单模块
            SizedBox(height: 8.0),
            forgotLabel
          ],
        ),
      ),
    );
  }
}

// 登陆信息填写表单模块
class LoginForm extends StatefulWidget{
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  // 1. 表格监控,校验数据
  // 设置文本框的监控器，可以设置初始值和监控后续的动作
  final TextEditingController _controller = TextEditingController();

  //1. 表格监控,校验数据

  // 2. 存储填写内容，并做合法性验证
  final loginFormKey = GlobalKey<FormState>();
  String _email = ''; // 保存输入的邮件地址
  String _pw = ''; // 密码字段
  List<User> list = List();
  var isLoading = false;

  void _submitLoginForm() async{
    // 2.1 当用户点击提交当时候，保存当前填写数据
    final form = loginFormKey.currentState;
    var authInfo;
    if(form.validate()) {
      loginFormKey.currentState.save();
      // print("await:1");
      authInfo =  await loginAuth(_email, _pw);
      // print("await:7");
    }
    Map<String, dynamic> auth2 = jsonDecode(authInfo);

// print('statusCode, ${auth2['statusCode']}!');
// print('message, ${authInfo2['message']}.');

    var authnumber = auth2['statusCode'];
    var authMessage = auth2['message'];
    if (authnumber == 200) {
      print("$authnumber, message: $authMessage");
          Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
          new HomePage(textData: 'Driver@luci.ai',))
      ).then((value){print(value);});
    }else{
      print("$authnumber, message: $authMessage");
    }

    // 2.2 提交合法性验证。

    // 2.3 根据用户Email 获取数据，并保存本地
    setState(() {
      isLoading = true;
    });


  }

  // 3. 登陆表单
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: loginFormKey, // Form 的key 属性设定
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
            ),
            onSaved: (value) {
              _email = value;
            },
          ),
          SizedBox(height: 24.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
            ),
            onSaved: (value) {
              _pw = value;
            },
          ),
          SizedBox(height: 32.0,),
          Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.black,
                child: Text('Login',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0.0,
                onPressed: _submitLoginForm,

              )
          )
        ],
      ),
    );
  }
}
