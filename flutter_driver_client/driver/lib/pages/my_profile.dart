import 'package:flutter/material.dart';
import 'package:luci_driver/pages/home_page.dart';
import 'package:luci_driver/utils/http.dart';
import 'package:luci_driver/widget/table_item_lib.dart';

class MyProfile extends StatefulWidget {

 static String tag = 'my-profile';
  final String textData;
  MyProfile({Key key, @required this.textData}):super(key: key);
  
  @override
  _MyProfileState createState() => new _MyProfileState();
}

class _MyProfileState extends State<MyProfile>{
  // Order orderDetail;
  // getData() async{
  //   print('fetch work:home.dart 2');
  //   var res = await getApiData('http://yoese.com/api/order.json');
  //   print('fetch work:home.dart 5');
  //   print(res);
  //   if(!mounted) return;
  //   setState(() {
  //     orderDetail = res.map((data) => new Order.fromJson(data)).toList()[0];
  //     print(orderDetail.deliverAddress);
  //     // print(orderlist[0].orderAddress);
  //   });
    
  // }
  // @override
  // void initState() {
  //   // debugPrint('fetch work:home.dart 1'); 
  //   // getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      backgroundColor: Color(0xffF2F2F2),
      body: SingleChildScrollView(

      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            TableHeaderText(title: ' '),
            Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TableItem(
                        title: 'Name:',
                        content: 'Mike Jarden',
                      ),
                      TableItem(
                        title: 'Email:',
                        content: 'MikeJarden@gmail.com',
                      ),
                      TableItemButtom(
                        title: 'Mobile',
                        content: '416 123 1234',
                      ),
                      
                    ],
                  ),
                ),
                
            TableHeaderText(title: 'Vehicle info'),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  
                  TableItem(
                    title: 'Brand',
                    content: ' FORD',
                  ),
                  TableItem(
                    title: 'Model',
                    content: 'EDGE LIMITED 4DR AWD',
                  ),
                  TableItem(
                    title: 'Palte',
                    content: 'BVVX 000',
                  ),
                  TableItemButtom(
                    title: 'Insurance',
                    content: '000 321 1234',
                  ),
                ],
              ),
            ),
          ],

        ),
     
    )
    );
  }
}
