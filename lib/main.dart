import 'package:flutter/material.dart';
import 'package:prm_as_tiennn8_se141023/router.dart';
import 'package:prm_as_tiennn8_se141023/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking HairCut',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: routers,
    );
  }
}
