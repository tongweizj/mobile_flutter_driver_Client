import 'package:flutter/material.dart';
import 'package:luci_driver/utils/adapt.dart';
import 'package:luci_driver/widget/page_item_lib.dart';
import 'package:luci_driver/pages/order_map.dart';
import 'package:luci_driver/pages/order_detail.dart';
import 'package:luci_driver/model/orders.dart';

/* order item lib
   订单列表中的订单模块
   time：2019-11-29
   writer：Max
*/

   containerTextGray(text) {
     return Container(
       margin: EdgeInsets.only(bottom: 3.0),
       //容器外填充
       child: Text( //卡片文字
         text,
         style: TextStyle(color: Colors.grey, fontSize: 14.0),
       ),
     );
   }

   orderType(otype) {
     return Container(
       margin: EdgeInsets.only(top: 2.0),
       //容器外填充
       constraints: BoxConstraints.tightFor(
           width: Adapt.px(100), height: Adapt.px(22)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            width: 1, //                   <--- border width here
            color: const Color(0xFFFFFFFF)
         ),
          borderRadius: BorderRadius.all(
             Radius.circular(2.0) //         <--- border radius here
         ),
       ),
       child: Text( 
         otype,
         style: TextStyle(color: Colors.white, fontSize: 18.0),
       ),
     );
   }
   orderItemDate(data){return Container(   
    decoration: BoxDecoration(
      border: Border.all(
      width: 1, 
        color: const Color(0xffB0C4DE)
      ),
      borderRadius: BorderRadius.all(
      Radius.circular(2.0) 
      ),
    ),
    width: Adapt.px(55),
    height: Adapt.px(60.5),
    margin: EdgeInsets.only(left: Adapt.px(0),right: Adapt.px(10),top: Adapt.px(0)),
    child: Column(  
      children: [
        containerTextGray(data.orderShowTime),
        containerTextGray(data.orderShowTimeType),
        orderType(data.orderType),
      ],
    ),
  );
   }
   orderItemAddress(context, orderID,orderAddress){
     return GestureDetector(
         onTap: (){
           Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) =>
                       OrderDetail(textData: orderID,))
           );
         },
         child:  Container(
           width: Adapt.px(250),
           alignment: Alignment.topLeft,
           margin: EdgeInsets.only(top:Adapt.px(0),bottom: 10.0), //容器外补白
           
           //color: Colors.green,
           child: new Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 textGrayLeft('order ID: $orderID'),
                 SizedBox(height: Adapt.px(3)), 
                 textBlack(orderAddress,16.0),
               ]
           ),
         )
     );
   }

   orderItemNavButton(context, addlist){
     return Container(     
        width: Adapt.px(30),
        // color: Colors.green,
        margin: EdgeInsets.only(top:Adapt.px(15)),
        child:  IconButton(
          icon: Icon(Icons.directions),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OrderMap(addlist))
            );
          },
      )
     );
   }

/* order item list
   订单列表中的订单模块
*/

class GetOrderList extends StatelessWidget {
  GetOrderList({Key key, this.orderlist,}) : super(key: key);

  List<Order> orderlist = List();
  @override
  Widget build(BuildContext context) { 
    return  Expanded(
              child: ListView(
              padding: EdgeInsets.only(left:Adapt.px(15),right: Adapt.px(15)),
              children: orderlist.map((data) {
              return Container(
                  margin: EdgeInsets.only(top:Adapt.px(0),bottom: Adapt.px(10)), //容器外补白
                  height: Adapt.px(65),
                  // color: Colors.orange,
                    child: Row(  
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        orderItemDate(data),
                        orderItemAddress(context, data.orderID,data.orderAddress),
                        orderItemNavButton(context,[data.deliverAddress,data.deliverLat,data.deliverLng]),
                      ],
                    ),
                );
              }).toList(),
            ),
          );
            
  }
}


class GetOrderList2 extends StatelessWidget {
  GetOrderList2({Key key, this.orderlist,}) : super(key: key);

  List<Order> orderlist = List();
  @override
  Widget build(BuildContext context) { 
    return  ListView(
              padding: EdgeInsets.only(left:Adapt.px(15),right: Adapt.px(15)),
              children: orderlist.map((data) {
              return Container(
                  margin: EdgeInsets.only(top:Adapt.px(0),bottom: Adapt.px(10)), //容器外补白
                  height: Adapt.px(65),
                  // color: Colors.orange,
                    child: Row(  
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        orderItemDate(data),
                        orderItemAddress(context, data.orderID,data.orderAddress),
                        orderItemNavButton(context, data.orderAddress),
                      ],
                    ),
                );
              }).toList(),
            );

            
  }
}
