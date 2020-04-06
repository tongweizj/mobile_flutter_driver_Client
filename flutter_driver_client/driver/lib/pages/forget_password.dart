import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  static String tag = 'forget-password';
  final String textData;
  ForgetPassword({Key key, @required this.textData}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(textData),
            OutlineButton(
                onPressed: () {
                  Navigator.pop(context, '我回来了！');
                }, child: new Text('回上一页！')),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/page3');
          //Navigator.pop(context, 'qqqqqqqq');
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
