class Order {
  final String orderType;
  final String orderDate;
  final String etdTime;
  final String etaTime;
  final String orderID;
  final String pickupAddress;
  final String deliverAddress;
  String orderAddress;
  String orderShowTime;
  String orderShowTimeType;
  final String orderStatus;
  final String customerName;
  final String customerMobile;
  final String deliverLat;
  final String deliverLng;

  Order._({
    this.orderType, // type: 'pickup' or 'deliver'
    this.orderDate,
    this.etdTime, //
    this.etaTime,
    this.orderShowTime,
    this.orderShowTimeType,
    this.orderID,
    this.pickupAddress,
    this.deliverAddress,
    this.orderAddress,
    this.orderStatus, // 订单状态：1：完成； 2：未完成
    this.customerName,
    this.customerMobile,
    this.deliverLat,
    this.deliverLng,
  });

  factory Order.fromJson(Map<String, dynamic> json) {

    return new Order._(
      orderType: json['orderType'],
      orderDate: json['orderDate'],
      etdTime: json['etdTime'],
      etaTime: json['etaTime'],
      orderID: json['orderID'],
      deliverAddress: json['deliverAddress'],
      pickupAddress: json['pickupAddress'],
      orderStatus: json['orderStatus'],
      orderAddress: '',
      orderShowTime: '',
      orderShowTimeType: '',
      customerName: json['customerName'],
      customerMobile: json['customerMobile'],
      deliverLat:json['deliverLat'],
      deliverLng:json['deliverLng'],
    );
  }

}

// Fake data
// final List<Order> orders = [
//   Order(
//     orderType: 'pickup',
//     etdTime: '2019',
//     etaTime: '',
//     orderID: '201911200001',
//     orderAddress: '7100 Woodbine Ave #100, Markham, ON L3R 5J2',
//     orderStatus: '2',
//   ),
//   Order(
//     orderType: 'pickup',
//     etdTime: '2019',
//     etaTime: '',
//     orderID: '201911200001',
//     orderAddress: '333337100 Woodbine Ave #100, Markham, ON L3R 5J2',
//     orderStatus: '2',
//   ),
// ];