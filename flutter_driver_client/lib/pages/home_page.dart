import 'package:flutter/material.dart';
import 'package:luci_driver/pages/side_bar.dart';
import 'package:luci_driver/model/orders.dart';
import 'package:luci_driver/utils/datafactory.dart';
import 'package:luci_driver/utils/http.dart';
import 'package:luci_driver/widget/page_item_lib.dart';
import 'package:luci_driver/widget/order_item_lib.dart';
import 'package:luci_driver/utils/config.dart';

List<Order> orderlist = List();
var isLoading = false;

// LocalData datatool;

class HomePage extends StatefulWidget {
  static String tag = '/home-page';
  final String textData;

  HomePage({Key key, @required this.textData}):super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getData() async{
    var orderApi = apiUrl + 'orders/today';
    var res = await getApiData(orderApi); // get api return json
    var resTmp =  makeOrdersData(res);  // change json to order model

    if(!mounted) return;
    setState(() {
      orderlist = resTmp;
    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('LOGO'),
      elevation: 0.0,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
          TableHeaderText(title: 'Today Schedule',),
          GetOrderList(orderlist: orderlist,),
          CallSupport(title: '',),
         ]
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text('text'),
      onTap: () => debugPrint('clicked'),
    );
  }
}