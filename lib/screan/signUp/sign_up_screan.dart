import 'package:flutter/material.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
import 'package:prm_as_tiennn8_se141023/screan/signUp/components/body.dart';

class SingUpScreen extends StatelessWidget {
  static String routeName = "/signUp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
