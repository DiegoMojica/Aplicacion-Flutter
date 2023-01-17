import 'package:flutter/material.dart';
import 'package:flutter_application_1/Search.dart';
import 'package:flutter_application_1/formulario/datos.dart';
import 'package:flutter_application_1/formulario/form.dart';
import 'package:flutter_application_1/formulario/operaciones.dart';

class Home extends StatefulWidget {
  static const String ROUTE = "/";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Note> notes = [];
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
            padding: const EdgeInsets.symmetric(vertical: 0),
            height: 300,
            child: Image.asset("assets/pensador.webp"),
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
                    decoration: const InputDecoration(labelText: "Usuario"),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Contraseña"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ERROR:El usuario o contraseña esta incorrecta,vuelvalo intentarlo";
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),

                  //Boton
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: const Color.fromARGB(255, 29, 73, 219),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const search())));
                      _login(context);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Iniciar sesión",
                            style: TextStyle(color: Colors.white),
                          ),

                          //circulo de carga
                          if (_loading)
                            Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.only(left: 20),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                        ]),
                  ),

                  //Opcion para registrarse
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "¿No estas registrado?",
                      ),
                      TextButton(
                        child: const Text(
                          "Registrarse",
                          selectionColor: Color.fromARGB(255, 29, 73, 219),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SavePage.ROUTE,
                                  arguments: Note.empty())
                              .then((value) => setState(
                                    () {
                                      _loadData();
                                    },
                                  ));
                        },
                      ),
                    ],
                  ),
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

  _loadData() async {
    List<Note> auxNote = await Operation.notes();

    setState(() {
      notes = auxNote;
    });
  }
}
