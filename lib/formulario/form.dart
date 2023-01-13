import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario/datos.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //variables de inpust
  final nombrec = TextEditingController();
  final nombre2c = TextEditingController();
  final apellidoc = TextEditingController();
  final apellido2c = TextEditingController();
  final correc = TextEditingController();
  final cedulac = TextEditingController();
  final telefonc = TextEditingController();
  final usuarioc = TextEditingController();
  final contrasenac = TextEditingController();
  final descripcionc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 29, 73, 219),
          title: Text(
            'Registro',
            style: TextStyle(fontSize: 28),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => print('Sapo'),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(children: [
                _textoNombre(context),
                _textoNombre2(context),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: _nombre(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: _nombre2(),
                  ),
                ],
              ),
              Row(children: [
                _textoApellido(context),
                _textoApellido2(context),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: _Apellido(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: _apellido2(),
                  ),
                ],
              ),
              _textoCorreo(context),
              SizedBox(
                height: 10,
              ),
              _correo(),
              Row(children: [
                _textoceldula(context),
                _textTelefono(context),
              ]),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: _Cedula(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: _telefono(),
                  ),
                ],
              ),
              _textoUsuario(context),
              SizedBox(
                height: 10,
              ),
              _userName(),
              _textoPassword(context),
              SizedBox(
                height: 10,
              ),
              _Password(),
              _textoDescrip(context),
              SizedBox(
                height: 10,
              ),
              _descrip(),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                  color: Colors.blueGrey,
                  child: Text('Mostrar segunda pantalla'),
                  onPressed: () {
                    _showSecondPage(context);
                  }),
            ],
          ),
        ));
  }

  Container _textoCorreo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Correo: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoNombre2(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Segundo nombre: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoNombre(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Primer Nombre: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoApellido(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Primer Apellido: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoApellido2(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Segundo Apellido: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textTelefono(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Telefono: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoceldula(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Cedula: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoUsuario(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('UserName: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoPassword(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Pasword: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoDescrip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Descripcion: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 29, 73, 219),
              fontWeight: FontWeight.bold)),
    );
  }

//inpusttt
  Container _nombre() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: nombrec,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  Container _nombre2() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: nombre2c,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ' '),
        ));
  }

  Container _Apellido() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: apellidoc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ' '),
        ));
  }

  Container _apellido2() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: apellido2c,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ' '),
        ));
  }

  Container _correo() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: correc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ' '),
        ));
  }

  Container _Cedula() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: cedulac,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  Container _telefono() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: telefonc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  Container _userName() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: usuarioc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  Container _Password() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: contrasenac,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  Container _descrip() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: descripcionc,
          maxLines: 5,
          maxLength: 200,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).pushNamed("/second",
        arguments: SecondPageArguments(
            nombre: nombrec.text,
            nombre2: nombre2c.text,
            apellido: apellidoc.text,
            apellido2: apellido2c.text,
            correo: correc.text,
            cedula: cedulac.text,
            telefono: telefonc.text,
            usuario: usuarioc.text,
            contrasena: contrasenac.text,
            descripcion: descripcionc.text));
  }

  @override
  void initState() {
    super.initState();
  }
}
