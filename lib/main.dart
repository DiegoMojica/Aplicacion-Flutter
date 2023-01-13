import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario/datos.dart';
import 'package:flutter_application_1/formulario/form.dart';
import 'package:flutter_application_1/login.dart';
//import 'login.dart';
import 'search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => Home(),
        "/second": (BuildContext context) => SegundaPage(),
      },
    );
  }
}
