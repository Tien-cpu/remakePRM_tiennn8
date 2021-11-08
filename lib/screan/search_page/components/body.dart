import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// commont import
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
// service import
// component
import './build_scrollable_services.dart';
//import service
import 'package:prm_as_tiennn8_se141023/service/categoryService.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/category.dart';

class Body extends StatelessWidget {
  final netWorkRequestCategory net = netWorkRequestCategory();
  final int service;

  Body({Key? key, required this.service});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularService(
              style: service,
            ),
          ],
        ),
      ),
    );
  }
}
