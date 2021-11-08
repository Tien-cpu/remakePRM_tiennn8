import 'package:flutter/material.dart';
import 'package:prm_as_tiennn8_se141023/screan/booking/detail_service_scren.dart';
import 'package:prm_as_tiennn8_se141023/screan/welcome/welcome_screan.dart';
import 'package:prm_as_tiennn8_se141023/screan/sign_in/sign_in_screan.dart';
import 'package:prm_as_tiennn8_se141023/screan/sign_in_success/sign_in_success_screan.dart';
import 'package:prm_as_tiennn8_se141023/screan/sign_in_fail/sign_in_fail_screan.dart';
import 'package:prm_as_tiennn8_se141023/screan/home/home_screan.dart';
import 'package:prm_as_tiennn8_se141023/screan/detail_service/detail_service_scren.dart';
import 'package:prm_as_tiennn8_se141023/screan/profile/profile.dart';
import 'package:prm_as_tiennn8_se141023/screan/schedule/home_screan.dart';
import 'package:prm_as_tiennn8_se141023/screan/signUp/sign_up_screan.dart';
import 'package:prm_as_tiennn8_se141023/screan/search_page/detail_service_scren.dart';
import 'package:prm_as_tiennn8_se141023/screan/notification/notification_scren.dart';

final Map<String, WidgetBuilder> routers = {
  welcomeScreen.routeName: (context) => welcomeScreen(),
  SinginScreen.routeName: (context) => SinginScreen(),
  SinginSuccessScreen.routeName: (context) => SinginSuccessScreen(),
  SinginFailScreen.routeName: (context) => SinginFailScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsServiceScreen.routeName: (context) => DetailsServiceScreen(),
  BookingScreen.routeName: (context) => BookingScreen(),
  ScheduleScreen.routeName: (context) => ScheduleScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SingUpScreen.routeName: (context) => SingUpScreen(),
  SearchServiceScreen.routeName: (context) => SearchServiceScreen(),
  notificationServiceScreen.routeName: (context) => notificationServiceScreen(),
};
