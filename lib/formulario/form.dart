import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario/datos.dart';
import 'package:flutter_application_1/formulario/operaciones.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SavePage extends StatefulWidget {
  static const String ROUTE = "/save";

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final _formKey = GlobalKey<FormState>();
  var cardTarjeta = MaskTextInputFormatter(
      mask: 'CC #.###.###-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var fecha = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var code = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var telefono = MaskTextInputFormatter(
      mask: '+## (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final NombreController = TextEditingController();
  final Nombre2Controller = TextEditingController();
  final apellidoController = TextEditingController();
  final apellido2Controller = TextEditingController();
  final CorreoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context)!.settings.arguments as Note;
    _init(note);

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Guardar"),
        ),
        body: Container(
          child: _buildForm(note),
        ),
      ),
    );
  }

  _init(Note note) {
    NombreController.text = note.nombre;
    Nombre2Controller.text = note.edad;
    apellidoController.text = note.telefono;
    apellido2Controller.text = note.correo;
    CorreoController.text = note.fecha;
  }

  Widget _buildForm(Note note) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Row(children: [
              _textoNombre(context),
              _textoNombre2(context),
            ]),
            const SizedBox(
              height: 15,
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
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              child: Text("Guardar"),
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (note.id > 0) {
                    // actualizacion
                    note.nombre = NombreController.text;
                    note.edad = Nombre2Controller.text;
                    note.telefono = apellidoController.text;
                    note.correo = apellido2Controller.text;
                    note.fecha = CorreoController.text;
                    Operation.update(note);
                  } else {
                    // insercion
                    Operation.insert(Note(
                      nombre: NombreController.text,
                      edad: Nombre2Controller.text,
                      telefono: apellidoController.text,
                      correo: apellido2Controller.text,
                      fecha: CorreoController.text,
                    ));
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPopScope() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('¿Seguro que quieres salir del formulario? '),
                  content: Text('Tienes datos sin guardar'),
                  actions: [
                    MaterialButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('No')),
                    MaterialButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Si'))
                  ],
                ))) ??
        false;
  }

  Container _textoNombre(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Primer nombre: ',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoNombre2(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Segundo nombre: ',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoApellido(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Primer Apellido: ',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoApellido2(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Segundo Apellido: ',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoCorreo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Correo: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

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
          validator: (value) {
            if (value!.isEmpty) {
              return "Tiene que colocar un telefono";
            }
            return null;
          },
          controller: NombreController,
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
          validator: (value) {
            if (value!.isEmpty) {
              return "Tiene que colocar un telefono";
            }
            return null;
          },
          controller: Nombre2Controller,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
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
          validator: (value) {
            if (value!.isEmpty) {
              return "Tiene que colocar un telefono";
            }
            return null;
          },
          controller: apellidoController,
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
          validator: (value) {
            if (value!.isEmpty) {
              return "Tiene que colocar un telefono";
            }
            return null;
          },
          controller: apellido2Controller,
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
          validator: (value) {
            if (value!.isEmpty) {
              return "Tiene que colocar un telefono";
            }
            return null;
          },
          controller: CorreoController,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ' '),
        ));
  }
}
