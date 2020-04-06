import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:luci_driver/utils/config.dart';

var isLoading = false;

/* utils */
//方法：json文件抓取
Future<List> getApiData(String url) async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return await json.decode(response.body);
  } else {
    throw Exception('Failed to load photos');
  }
}

//方法：Auth Post 
// //创建HttpClient
// HttpClient _httpClient = HttpClient();

// //进行POST请求
// postUrlHttpClient(String email, String passwd) async {
//   print("await:2");
//   var authInfo;
//   var url = apiUrl + "auth";
  
//   await _httpClient.postUrl(Uri.parse(url))
//   .then((HttpClientRequest request) {
//     print("await:3");
//       //这里添加POST请求Body的ContentType和内容
//       //这个是application/x-www-form-urlencoded数据类型的传输方式
//       request.headers.contentType = ContentType("application", "x-www-form-urlencoded");
//       request.write("email=${email.trim()}&password=$passwd");
//       return request.close();
//     })
//   .then((HttpClientResponse response) {
//     print("await:4");
//       response.transform(utf8.decoder).listen((contents) {
//           authInfo = contents;
//           print("await:5:$contents");
//         });
//       if (response.statusCode == 302) {
//         response.transform(utf8.decoder).listen((contents) {
//           print("await:5:302:$contents");
//           authInfo = contents;
//         });
//       } else {
//         print("error");
//       }
//     });
//     print("await:6");
//     return await authInfo;
// }




//进行POST请求
loginAuth(String email, String passwd) async {
  print("await:2");
  var authInfo;
  var url = apiUrl + "auth";
  var body = Map<String, String>();
  body["email"] = email;
  body["password"] = passwd;

  var client = http.Client();
  var response = await client.post(url, body: body);
  print("await:3");
  return response.body;
  
}

// 做地址转换
Future<List> getOrderLocation(String address) async{
  var url = "https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=AIzaSyBZLatWTx7Yte9ueNWtu7Fn5g-pblGvMdI";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return await json.decode(response.body);
  } else {
    throw Exception('Failed to load photos');
  }


}
