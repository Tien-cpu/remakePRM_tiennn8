import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:prm_as_tiennn8_se141023/models/service_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';

class netWorkRequestService {
  final porturl = 'http://3.19.62.41:8190';

  Future<List<ServicesModel>> letcategory() async {
    Uri uri = Uri.parse(porturl + '/service/getservice');
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
    // if (res.statusCode == 200) {
    List<dynamic> body = json.decode(res.body);
    List<ServicesModel> category =
        body.map((dynamic e) => ServicesModel.fromJson(e)).toList();
    return category;
    // } else {
    // throw Exception("not found");
    // }
  }

  Future<List<ServicesModel>> getSerVice(int id) async {
    Uri uri = Uri.parse(porturl + '/service/getservice/' + id.toString());
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
    // if (res.statusCode == 200) {
    List<dynamic> body = json.decode(res.body);
    List<ServicesModel> category =
        body.map((dynamic e) => ServicesModel.fromJson(e)).toList();
    return category;
    // } else {
    // throw Exception("not found");
    // }
  }

  Future<bool> booking(
    ServicesModel service,
    DateTime pickdate,
    String dtime,
  ) async {
    Uri uri = Uri.parse(porturl + '/api/v1/user/appointment');
    http.Response res;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int counter = prefs.getInt('keyID')!;

      res = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          "serviceid": service.id.toString(),
          "cusid": counter.toString(),
          "totalPrice": service.offerPrice.toString(),
          "date": DateFormat('MM/dd/yyyy').format(pickdate).toString(),
          "time": dtime.toString(),
        },
      );
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
    print(res.statusCode);
    if (res.statusCode == 200) {
      return true;
    } else if (res.statusCode == 291) {
      return false;
    } else {
      throw Exception("not found");
    }
  }
}
