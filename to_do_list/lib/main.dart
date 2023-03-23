import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:to_do_list/pages/home_page.dart';
import 'package:to_do_list/pages/landing_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
      // home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    );
  }
}
