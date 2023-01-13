import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override

//La parte de arriba el titulo
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                margin: const EdgeInsets.all(10),
                child: Image.asset("assets/pensador.webp"),
              ),
              const Text("Productores de software",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: (20))),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.grey[100],
                child: const Text("Buscador"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.grey[100],
                child: const Text("Registros"),
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.black87,
                alignment: Alignment.center,
                child: const Text(
                  "Salir",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
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

            //El texto de Usuario
            Container(
              padding: EdgeInsets.fromLTRB(26, 20, 10, 10),
              child: Text(
                "Usuario",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 28, 73, 219),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),

            //El buscador

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

            //El boton de buscar
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Color.fromARGB(255, 29, 73, 219),
                      child: Icon(Icons.search),
                      onPressed: (() {})),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
