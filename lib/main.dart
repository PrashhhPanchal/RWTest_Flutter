import 'package:flutter/material.dart';
import 'package:rw_test_flutter/helper/ColorRes.dart';
import 'package:rw_test_flutter/screens/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RW Test Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorRes.primaryColor,
        primarySwatch: ColorRes.primarySwatch,
      ),
      home: MainScreen(),
    );
  }
}
