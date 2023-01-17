import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario/form.dart';
import 'package:flutter_application_1/formulario/muestraDatos.dart';
import 'package:flutter_application_1/login.dart';

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
      //menu desplegado "drawer"
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(
                height: 5,
              ),
              //buscador
              Container(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => search())));
                  },
                  padding:
                      const EdgeInsets.symmetric(horizontal: 122, vertical: 18),
                  color: Color.fromARGB(255, 124, 123, 123),
                  child: const Text(
                    "Buscador",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),

              //registro
              Container(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => ListPage())));
                  },
                  padding:
                      const EdgeInsets.symmetric(horizontal: 122, vertical: 18),
                  color: Color.fromARGB(255, 124, 123, 123),
                  child: const Text(
                    "Registros",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              //Boto lateral de salir
              Expanded(child: Container()),
              Container(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => Home())));
                  },
                  padding:
                      const EdgeInsets.symmetric(horizontal: 137, vertical: 18),
                  color: Colors.black87,
                  child: const Text(
                    "Salir",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      //El appBar que es todo lo de arriba del body
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
                    color: Color.fromARGB(255, 0, 51, 78),
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
                  child: FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 29, 73, 219),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
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
