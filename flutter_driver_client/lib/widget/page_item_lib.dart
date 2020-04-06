import 'package:flutter/material.dart';
import 'package:luci_driver/utils/adapt.dart';
/* page item lib
   各个页面中通用的前端元素
   time：2019-11-29
   writer：Max
*/

/*
列表头部的大标题
*/ 

class TableHeaderText extends StatelessWidget {
  TableHeaderText({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) { 
    return Container(
        margin: EdgeInsets.only(left: Adapt.px(15),top: Adapt.px(15),bottom: Adapt.px(5)), //容器外填充
        constraints: BoxConstraints.tightFor(width: Adapt.px(345) , height: Adapt.px(40)), //卡片大小
        alignment: Alignment.bottomLeft, //卡片内文字居中
        child: Text( //卡片文字
          "Today Schedule", style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      );
  }
}

/*
页面底部的服务支持按钮
To：添加拨打电话功能
*/ 
class CallSupport extends StatelessWidget {
  CallSupport({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) { 
    return Container(
        margin: EdgeInsets.all(15.0), //容器外填充
        constraints: BoxConstraints.tightFor(width: Adapt.px(345), height: 40.0), //卡片大小
        alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1, //                   <--- border width here
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0) //         <--- border radius here
            ),
          ),//卡片内文字居中

        child: Text( //卡片文字
          "callSupport", style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
      );
  }
}


/* 前端部件 */
textGray(text,[double fontsize = 14.0]) {
 return Text( 
  text,
  style: TextStyle(color: Colors.grey, fontSize: fontsize),
  );
}

textBlack(text,[double fontsize = 14.0]) {
  return Text( //卡片文字
    text,
    style: TextStyle(color: Colors.black87, fontSize: fontsize),
  );
}

textGrayLeft(text) {
  return Text( //卡片文字
    text,
    style: TextStyle(color: Colors.grey, fontSize: 14.0),
    textAlign: TextAlign.left,
  );
}