import 'package:flutter/material.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/coustom_bottom_nav_bar.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/custom_app_bar.dart';
import 'package:prm_as_tiennn8_se141023/screan/detail_service/components/body.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/service_model.dart';

class DetailsServiceScreen extends StatelessWidget {
  static String routeName = "/detailsService";

  @override
  Widget build(BuildContext context) {
    final ServiceDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ServiceDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.service.rating!),
      ),
      body: Body(service: agrs.service),
    );
  }
}

class ServiceDetailsArguments {
  final ServicesModel service;

  ServiceDetailsArguments({required this.service});
}
