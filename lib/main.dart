import 'package:flutter/material.dart';

import 'package:flutter_application_1/formulario/form.dart';
import 'package:flutter_application_1/formulario/muestraDatos.dart';
import 'package:flutter_application_1/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.ROUTE,
      routes: {
        Home.ROUTE: (_) => Home(),
        SavePage.ROUTE: (_) => SavePage(),
        ListPage.ROUTE: (_) => ListPage()
      },
    );
  }
}
