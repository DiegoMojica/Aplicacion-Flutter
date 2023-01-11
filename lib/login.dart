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
                  ),

                  //Boton
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
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
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

//circuñp
  void _login(BuildContext context) {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    }
  }
}
