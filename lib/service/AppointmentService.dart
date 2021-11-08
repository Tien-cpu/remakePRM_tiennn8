import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
//import model
import 'package:prm_as_tiennn8_se141023/models/appointment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class netWorkRequestAppointmentService {
  final porturl = 'http://3.19.62.41:8190/service/getservice';

  Future<List<AppointmentModel>> listAppointmentPending(int style) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('keyID')!;
    String URL = 'http://3.19.62.41:8190/api/v1/user/appointment/' +
        counter.toString() +
        '/' +
        style.toString();
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
      List<AppointmentModel> category =
          body.map((dynamic e) => AppointmentModel.fromJson(e)).toList();
      print(category.length);
      return category;
    } else {
      throw Exception("not found");
    }
  }

  Future<bool> CancelAppointmentPending(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('keyID')!;
    String URL =
        'http://3.19.62.41:8190/api/v1/user/appointment/' + id.toString();
    print(URL);
    Uri uri = Uri.parse(URL);
    http.Response res;
    try {
      res = await http.post(uri, headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
    if (res.statusCode == 200) {
      return true;
    } else if (res.statusCode == 291) {
      return false;
    } else {
      throw Exception("not found");
    }
  }
}
