import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:prm_as_tiennn8_se141023/models/category.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// import 'package:dio/dio.dart';

class netWorkRequestCategory {
  final porturl = 'http://3.19.62.41:8190/category/getcategory';

  Future<List<categorymodel>> letcategory() async {
    Uri uri = Uri.parse(porturl);
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
      List<categorymodel> category =
          body.map((dynamic e) => categorymodel.fromJson(e)).toList();
      return category;
    } else {
      throw Exception("not found");
    }
  }
}
