import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future showToast(
    {required String msg, Color? backgroundColor, Color? textColor}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16,
    gravity: ToastGravity.CENTER,
    // backgroundColor: ColorLight.error ?? ColorLight.primary,
    backgroundColor: backgroundColor ?? Color(0xFFD1870B),
    textColor: textColor ?? Colors.white,
  );
}
