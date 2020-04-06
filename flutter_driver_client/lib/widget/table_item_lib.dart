import 'package:flutter/material.dart';
import 'package:luci_driver/utils/adapt.dart';

/* 表格头部标题*/
class TableHeaderText extends StatefulWidget {
  const TableHeaderText({
    Key key, 
    this.title, 
    this.fontsize,
    }) : super(key: key);

  final String title;
  final double fontsize;

  _TableHeaderTextState createState() => new _TableHeaderTextState();
}
class _TableHeaderTextState extends State<TableHeaderText> {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
            //左边添加8像素补白
            padding: EdgeInsets.only(left: Adapt.px(10),top: Adapt.px(15),bottom: Adapt.px(5) ),
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.grey, fontSize: widget.fontsize),
         textAlign: TextAlign.left,
              )
          );
  }
}

/* 表格标准行*/
class TableItem extends StatelessWidget {
  TableItem({Key key, this.title,this.content,}) : super(key: key);

  // final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) { 
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left:Adapt.px(10),right:Adapt.px(10) ),
          // color: Colors.amber[600],
          width: Adapt.px(80),
          height: Adapt.px(30),
          child: Text(
                  title,
                  style: new TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
        ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:Adapt.px(15),left: Adapt.px(1)),
                  // color: Colors.amber[600],
                  width: Adapt.px(260),
                  height: Adapt.px(40),
                  child: Text(
                          content,
                          style: new TextStyle(color: Colors.black54, fontSize: 16.0),
                        ),
                ),
                Container(
                  margin: EdgeInsets.only(right: Adapt.px(10),bottom:Adapt.px(5) ),
                  // color: Colors.red,
                  width: Adapt.px(260),
                  // height: Adapt.px(20),
                  child: Divider(),
                ),
               
        ],
        )
              ],
      );
            
  }
}

/* 表格行（支持换行）*/
class TableItemHigh extends StatelessWidget {
  TableItemHigh({Key key, this.icon, this.title, this.onPressed}) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 12.0,
              right: 20.0,
              bottom: 10.0,
            ),
            child: new Row(
              children: [
                new Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: new Icon(
                    icon,
                    color: Colors.black54,
                  ),
                ),
                new Expanded(
                  child: new Text(
                    title,
                    style: new TextStyle(color: Colors.black54, fontSize: 16.0),
                  ),
                ),
                new Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: new Divider(),
          )
        ],
      ),
    );
  }
}



/* 表格行(底部)*/
class TableItemButtom extends StatelessWidget {
  TableItemButtom({Key key, this.title,this.content,}) : super(key: key);

  // final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) { 
    return Row(
      
              children: [
                Container(
                  margin: EdgeInsets.all(Adapt.px(10)),
                  // color: Colors.amber[600],
                  width: Adapt.px(80),
                  height: Adapt.px(30),
                  child: Text(
                          title,
                          style: new TextStyle(color: Colors.black54, fontSize: 16.0),
                        ),
                ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:Adapt.px(10),left: Adapt.px(1)),
                  // color: Colors.amber[600],
                  width: Adapt.px(260),
                  height: Adapt.px(40),
                  child: Text(
                          content,
                          style: new TextStyle(color: Colors.black54, fontSize: 16.0),
                        ),
                ),
        ],
        )
              ],
      );
            
  }
}
