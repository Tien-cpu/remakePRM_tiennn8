import 'package:flutter/material.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/coustom_bottom_nav_bar.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/custom_app_barb.dart';
import 'package:prm_as_tiennn8_se141023/screan/search_page/components/body.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/service_model.dart';

class SearchServiceScreen extends StatelessWidget {
  static String routeName = "/searchService";

  @override
  Widget build(BuildContext context) {
    final ServiceSearchArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ServiceSearchArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(style: agrs.service),
      ),
      body: Body(service: agrs.service),
    );
  }
}

class ServiceSearchArguments {
  final int service;

  ServiceSearchArguments({required this.service});
}
