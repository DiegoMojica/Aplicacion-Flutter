import 'package:flutter/material.dart';

class SegundaPage extends StatelessWidget {
  const SegundaPage({super.key});

  @override
  Widget build(BuildContext context) {
    SecondPageArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SecondPageArguments;

    return Scaffold(
      appBar: AppBar(title: Text('segunda')),
      body: Column(
        children: [
          Text(arguments.nombre),
          Text(arguments.apellido),
        ],
      ),
    );
  }
}

class SecondPageArguments {
  String nombre = "";
  String nombre2 = "";
  String apellido = "";
  String apellido2 = "";
  String correo = "";
  String cedula = "";
  String telefono = "";
  String usuario = "";
  String contrasena = "";
  String descripcion = "";
  SecondPageArguments(
      {required this.nombre,
      required this.nombre2,
      required this.apellido,
      required this.apellido2,
      required this.correo,
      required this.cedula,
      required this.telefono,
      required this.usuario,
      required this.contrasena,
      required this.descripcion});
}
