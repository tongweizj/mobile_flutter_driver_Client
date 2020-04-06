// import 'package:shared_preferences/shared_preferences.dart';
import 'package:luci_driver/model/orders.dart';



/* utils */
// Home： handle data from json， add order address
makeOrdersData(List rawdata)  {
  // final String _url = 'http://yoese.com/api/orders.json';
  // print('fetch work:http.dart 3');  
  var ordersData = rawdata.map((data) => new Order.fromJson(data)).toList();
  print(ordersData.length);
  for (var tmp in ordersData){
    print(tmp.orderType);
    var tmpTime;
    if(tmp.orderType == 'pickup'){
      tmp.orderAddress = tmp.pickupAddress;
    }else{
      tmp.orderAddress = tmp.deliverAddress;
    }

    if(tmp.orderStatus == '0'){
      tmpTime = tmp.etdTime;
      tmp.orderShowTimeType = 'ETD';
    }else{
      tmpTime = tmp.etaTime;
      tmp.orderShowTimeType = 'ETA';
    }
    tmp.orderShowTime = getOrderItemTime(tmpTime);
    print('makeOrdersData:');
    print(tmp.orderAddress);
  }
  return  ordersData;
}


String getOrderItemTime(String x){
  var d1 = DateTime.parse(x);
  String d2 = "${d1.hour}:${d1.minute}";
  return d2;
}