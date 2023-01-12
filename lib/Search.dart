import 'package:flutter/cupertino.dart';
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
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 29, 73, 219),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 8,
              width: 2,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(26, 20, 10, 10),
              child: Text(
                "Usuario",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 28, 73, 219),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Column(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 200, 202, 204),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: ("Buscar Usuario"),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
