import 'dart:convert';
import 'package:prm_as_tiennn8_se141023/models/reslogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
// import 'package:dio/dio.dart';

class netWorkRequestnode {
  final porturl = 'http://3.19.62.41:8190/api/v1/user/login';
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<List<reslogin>> checklogin() async {
    Uri uri = Uri.parse(porturl);
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
      List<dynamic> body = json.decode(res.body);
      List<reslogin> post =
          body.map((dynamic e) => reslogin.fromJson(e)).toList();

      return post;
    } else {
      List<dynamic> body = json.decode(res.body);
      List<reslogin> post =
          body.map((dynamic e) => reslogin.fromJson(e)).toList();

      return post;
    }
  }

  Future<reslogin> checklogint(String email, String pass) async {
    Uri uri = Uri.parse(porturl + '/checklogin');
    http.Response res;
    final SharedPreferences prefs = await _prefs;
    try {
      res = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {"email": email, "pass": pass},
      );
      if (res.statusCode == 200) {
        List<dynamic> body = json.decode(res.body);
        reslogin post =
            body.map((dynamic e) => reslogin.fromJson(e)).toList().first;
        prefs.setInt("keyID", post.id);
        return post;
      } else {
        reslogin post = new reslogin(id: -1);
        return post;
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  Future register(String email, String pass) async {
    Uri uri = Uri.parse(porturl + '/regislogin');
    http.Response res;
    final SharedPreferences prefs = await _prefs;
    try {
      res = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {"email": email, "pass": pass},
      );
      print(res);
      return;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  resloginF() {
    // Future<reslogin> ketqua = checklogint();
  }
}
