import 'dart:convert';
import 'package:prm_as_tiennn8_se141023/models/Notification_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class netWorkRequestNotificationnode {
  final porturl = 'http://3.19.62.41:8190/api/v1/admin/getnotifications';
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<List<notification>> listNotificationPending() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('keyID')!;
    String URL = 'http://3.19.62.41:8190/api/v1/admin/getnotifications/' +
        counter.toString();
    print(URL);
    Uri uri = Uri.parse(URL);
    http.Response res;
    try {
      res = await http.get(uri, headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
    if (res.statusCode == 200) {
      print(res.body);
      List<dynamic> body = json.decode(res.body);
      List<notification> category =
          body.map((dynamic e) => notification.fromJson(e)).toList();
      print(category.length);
      return category;
    } else {
      throw Exception("not found");
    }
  }
}
