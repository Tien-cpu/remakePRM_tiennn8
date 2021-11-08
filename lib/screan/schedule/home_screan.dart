import 'package:flutter/material.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/coustom_bottom_nav_bar.dart';
import 'package:prm_as_tiennn8_se141023/screan/schedule/components/body.dart';

class ScheduleScreen extends StatelessWidget {
  static String routeName = "/schedulePage";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
