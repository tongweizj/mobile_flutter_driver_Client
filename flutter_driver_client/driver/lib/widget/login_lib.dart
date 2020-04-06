import 'package:flutter/material.dart';
import 'package:luci_driver/utils/adapt.dart';

/* login page lib
   登录页面中的各个页面元素
   time：2019-12-6
   writer：Max
*/

/* 前端部件 */
textGray(text,[double fontsize = 14.0]) {
 return Text( 
  text,
  style: TextStyle(color: Colors.grey, fontSize: fontsize),
  );
}

headerBox() {
  return Padding(
  padding: EdgeInsets.all(8.0),
    child: Text(
    'Welcome Back',
    style: TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
    color: Colors.black),
    textAlign: TextAlign.left,
    ),
);
}
