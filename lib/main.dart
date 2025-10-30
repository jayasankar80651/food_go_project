import 'package:flutter/material.dart';
import 'package:foodgo_project/firstpage.dart';
import 'package:foodgo_project/secondpage.dart';
import 'package:foodgo_project/thirdpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodGo (),
      debugShowCheckedModeBanner: false,
    );
  }
}
      