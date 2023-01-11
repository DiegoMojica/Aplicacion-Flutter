import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          //Imagen (pensador.webp)
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
                      decoration: InputDecoration(labelText: "Usuario")),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Contraseña"),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),

                  //Boton
                  MaterialButton(
                    color: Color.fromRGBO(52, 75, 181, 255),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {
                      _login(context);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Iniciar sesión",
                            style: TextStyle(color: Colors.white),
                          ),
                          if (_loading) //circulo de carga
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
                        child: Text("Registrarse"),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            "/register",
                          );
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
