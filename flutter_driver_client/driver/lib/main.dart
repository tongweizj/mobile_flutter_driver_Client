import 'package:flutter/material.dart';
import 'package:luci_driver/pages/login_page.dart';
import 'package:luci_driver/pages/forget_password.dart';
import 'package:luci_driver/pages/forget_password_result.dart';
import 'package:luci_driver/pages/home_page.dart';
import 'package:luci_driver/pages/order_detail.dart';
import 'package:luci_driver/pages/order_map.dart';
import 'package:luci_driver/pages/my_orders.dart';
import 'package:luci_driver/pages/my_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    ForgetPassword.tag: (context) => ForgetPassword(),
    ForgetPasswordResult.tag: (context) => ForgetPasswordResult(),
    HomePage.tag: (context) => HomePage(),
    OrderDetail.tag: (context) => OrderDetail(),
    OrderMap.tag: (context) => OrderMap(),
    MyOrders.tag: (context) => MyOrders(),
    MyProfile.tag: (context) => MyProfile(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luci.Driver',

      //theme: ThemeData.dark(),

      home: LoginPage(),
    );
  }
}