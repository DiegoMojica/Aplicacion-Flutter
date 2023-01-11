import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
//import 'login.dart';
import 'Search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
