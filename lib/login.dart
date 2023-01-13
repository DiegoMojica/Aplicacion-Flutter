import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario/form.dart';
import 'package:flutter_application_1/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Imagen (pensador.webp)
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Image.asset("assets/pensador.webp"),
            height: 300,
          ),

          //Usuario y Contraseña
          Center(
              child: Card(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "Usuario"),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Contraseña"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ERROR:El usuario o contraseña esta incorrecta,vuelvalo intentarlo";
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 30),

                  //Boton
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Color.fromARGB(255, 29, 73, 219),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => search())));
                      _login(context);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Iniciar sesión",
                            style: TextStyle(color: Colors.white),
                          ),

                          //circulo de carga
                          if (_loading)
                            Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.only(left: 20),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                        ]),
                  ),

                  //Opcion para registrarse
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "¿No estas registrado?",
                      ),
                      TextButton(
                        child: Text(
                          "Registrarse",
                          selectionColor: Color.fromARGB(255, 29, 73, 219),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => MyHome())));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

//circulo de carga
  void _login(BuildContext context) {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    }
  }
}
