import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Arya Shakti',
      debugShowCheckedModeBanner: false,

      locale: const Locale('en', 'US'),
      home: const LoginScreen(),

    );
  }
}
