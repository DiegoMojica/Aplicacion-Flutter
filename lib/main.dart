import 'package:flutter/material.dart';

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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Image.asset("assets/pensador.webp"),
            height: 300,
          ),
          Center(
              child: Card(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(labelText: "Usuario")),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Contraseña"),
                    obscureText: true,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
