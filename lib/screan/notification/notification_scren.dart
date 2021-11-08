import 'package:flutter/material.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/coustom_bottom_nav_bar.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/custom_app_barb.dart';
import 'package:prm_as_tiennn8_se141023/screan/notification/components/body.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/service_model.dart';

class notificationServiceScreen extends StatelessWidget {
  static String routeName = "/notificationService";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        title: Text("notification"),
      ),
      body: Body(),
    );
  }
}
