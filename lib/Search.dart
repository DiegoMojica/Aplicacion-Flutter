import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Busqueda",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 29, 73, 219),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              "Usuario",
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 143, 144, 146),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintText: ("Que quieres buscar putito :)"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
