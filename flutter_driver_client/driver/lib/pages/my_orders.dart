import 'package:flutter/material.dart';
import 'package:luci_driver/widget/order_item_lib.dart';
import 'package:luci_driver/model/orders.dart';
import 'package:luci_driver/utils/http.dart';
import 'package:luci_driver/utils/datafactory.dart';
import 'package:luci_driver/utils/config.dart';

List<Order> orderlist0 = List();
List<Order> orderlist1 = List();
//顶部TabBar切换栏实现的第二种方式

class MyOrders extends StatefulWidget {
  static String tag = '/home-page';
  final String textData;

  MyOrders({Key key, @required this.textData}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyOrdersState();
  }
}
class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
    getData() async{
      // var orderApi3 = apiUrl + 'orders/today';
    var orderApi0 = apiUrl + 'orders/status/0';
    var orderApi1 = apiUrl + 'orders/status/1';
    var res0 = await getApiData(orderApi0);
    var res1 = await getApiData(orderApi1);
    var resTmp0 =  makeOrdersData(res0);
    var resTmp1 =  makeOrdersData(res1);
    print("my order33:");
    print(resTmp0[0].orderAddress);
    if(!mounted) return;
    setState(() {
      orderlist0 = resTmp0;
      orderlist1 = resTmp1;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    getData();
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Orders'),
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              // icon: new Icon(Icons.directions_bike),
              text: 'Sending',
            ),
            new Tab(
              // icon: new Icon(I?cons.directions_boat),
              text: 'Delived',
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          // GetOrderList(orderlist: orderlist0,),
          // GetOrderList(orderlist: orderlist0,),
          GetOrderList2(orderlist: orderlist0,),
          GetOrderList2(orderlist: orderlist1,),
        ],
      ),
    );
  }
    }