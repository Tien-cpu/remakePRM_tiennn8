// import 'package:flutter/material.dart';
// import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
// import 'package:prm_as_tiennn8_se141023/common_patten/coustom_bottom_nav_bar.dart';
// import 'package:prm_as_tiennn8_se141023/common_patten/custom_app_barb.dart';
// import 'package:prm_as_tiennn8_se141023/models/appointment_model.dart';
// import 'package:prm_as_tiennn8_se141023/screan/deteil-Schedule/components/body.dart';
// //import model
// import 'package:prm_as_tiennn8_se141023/models/service_model.dart';

// class DetailsScheduleScreen extends StatelessWidget {
//   static String routeName = "/detailsSechedule";

//   @override
//   Widget build(BuildContext context) {
//     final ScheduleDetailsArguments agrs =
//         ModalRoute.of(context)!.settings.arguments as ScheduleDetailsArguments;
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F6F9),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(AppBar().preferredSize.height),
//         child: CustomAppBar(style: 1,),
//       ),
//       body: Body(service: agrs.service),
//     );
//   }
// }

// class ScheduleDetailsArguments {
//   final AppointmentModel service;

//   ScheduleDetailsArguments({required this.service});
// }
