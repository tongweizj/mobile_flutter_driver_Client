import 'package:flutter/material.dart';
import 'package:luci_driver/model/orders.dart';
import 'package:luci_driver/widget/table_item_lib.dart';
import 'package:luci_driver/utils/http.dart';
import 'package:luci_driver/utils/config.dart';

class OrderDetail extends StatefulWidget {

  static String tag = 'order-detail';
  final String textData;
  OrderDetail({Key key, @required this.textData}):super(key: key);
  
  @override
  _OrderDetailState createState() => new _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail>{
  Order orderDetail;
  getData() async{
    print('fetch work:home.dart 2');
    var orderApi = apiUrl + 'order/' + widget.textData;
    var res = await getApiData(orderApi);
    print('fetch work:home.dart 5');
    print(res);
    if(!mounted) return;
    setState(() {
      orderDetail = res.map((data) => new Order.fromJson(data)).toList()[0];
      print(orderDetail.deliverAddress);
      // print(orderlist[0].orderAddress);
    });
    
  }
  @override
  void initState() {
    debugPrint('fetch work:home.dart 1'); 
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.textData}Order Detail'),
      ),
      backgroundColor: Color(0xffF2F2F2),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            TableHeaderText(title: 'order info'),
            Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TableItem(
                        title: 'Order ID',
                        content: orderDetail.orderID,
                      ),
                      TableItem(
                        title: 'Date',
                        content: orderDetail.orderDate,
                      ),
                      TableItem(
                        title: 'Pick Up',
                        content: orderDetail.pickupAddress,
                      ),
                      TableItemButtom(
                        title: 'Send to',
                        content: orderDetail.deliverAddress,
                      ),
                    ],
                  ),
                ),
                
            TableHeaderText(title: 'customer info'),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  
                  TableItem(
                    title: 'Name',
                    content: orderDetail.customerName,
                  ),
                  TableItemButtom(
                    title: 'Mobile',
                    content: orderDetail.customerMobile,
                  ),
                ],
              ),
            ),
          ],

        ),
     
    );
  }
}
