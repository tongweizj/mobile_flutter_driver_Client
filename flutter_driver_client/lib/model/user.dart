class User {
  final String userEmail;
  final String userName;
  final String userPw;
  final String userMobile;
  final String vehicleMake;
  final String vehicleModel;
  final String vehicleLicensePlate;
  final String insurance;

  User._({
    this.userEmail,  // 用户邮箱，用来登陆
    this.userName,   // 用户名字
    this.userPw,     // 用户密码
    this.userMobile, // 用户电话
    this.vehicleMake, // 车辆生产厂商
    this.vehicleModel, // 车辆型号
    this.vehicleLicensePlate, // 车牌
    this.insurance,   // 车辆保险号
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return new User._(
      userEmail: json['userEmail'],
      userMobile: json['userInfo']['userMobile'],
    );
  }
}



// Fake data
// final List<User> users = [
//   User(
//     userEmail: 'driver@luci.ai',
//     userName: 'luci',
//     userPw: '123456',
//     userMobile: '4161231234',
//     vehicleMake: 'ford',
//     vehicleModel: 'Escape',
//     vehicleLicensePlate: '6XSU832',
//     insurance: '12345678912',
//   ),
//   User(
//     userEmail: 'hi@luci.ai',
//     userName: 'hi',
//     userPw: '123456',
//     userMobile: '4161231235',
//     vehicleMake: 'Honda',
//     vehicleModel: 'Fit',
//     vehicleLicensePlate: '7XSU832',
//     insurance: '92345678912',
//   ),
// ];