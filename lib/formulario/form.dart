import 'package:flutter/material.dart';

import 'package:flutter_application_1/formulario/datos.dart';
import 'package:flutter_application_1/formulario/operaciones.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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

  //nuevas variables
  final novedadc = TextEditingController();
  final codigoc = TextEditingController();
  final nombrec = TextEditingController();
  final codDescripc = TextEditingController();
  final cargoc = TextEditingController();
  final depenDc = TextEditingController();
  final correc = TextEditingController();
  final codOperc = TextEditingController();
  final operRespc = TextEditingController();
  final descripcionc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context)!.settings.arguments as Note;
    _init(note);

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Guardar"),
        ),
        body: Container(
          child: _buildForm(note),
        ),
      ),
    );
  }

  _init(Note note) {
    novedadc.text = note.novedad;
    codigoc.text = note.codigo;
    nombrec.text = note.nombre;
    codDescripc.text = note.codDescrip;
    cargoc.text = note.cargo;
    correc.text = note.correo;
    depenDc.text = note.depenD;
    codOperc.text = note.codOper;
    operRespc.text = note.operResp;
  }

  Widget _buildForm(Note note) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Row(children: [
              _textoNovedad(context),
              _textocodigo(context),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.47,
                  height: MediaQuery.of(context).size.width * 0.09,
                  child: _Novedad(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.width * 0.09,
                  child: _codigo(),
                ),
              ],
            ),
            _textoNombre(context),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.47,
              height: MediaQuery.of(context).size.width * 0.09,
              child: _Nombre(),
            ),
            _textocodDescrip(context),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.47,
                  height: MediaQuery.of(context).size.width * 0.09,
                  child: _codDescrip(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.width * 0.09,
                  child: _depenD(),
                ),
              ],
            ),
            _textoCorreo(context),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.47,
              height: MediaQuery.of(context).size.width * 0.09,
              child: _correo(),
            ),
            _textocargo(context),
            Container(
              width: MediaQuery.of(context).size.width * 0.47,
              height: MediaQuery.of(context).size.width * 0.09,
              child: _cargo(),
            ),
            _textooperResp(context),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.47,
                  height: MediaQuery.of(context).size.width * 0.09,
                  child: _codOper(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.width * 0.09,
                  child: _operResp(),
                ),
              ],
            ),
            MaterialButton(
              child: Text("Guardar"),
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (note.id > 0) {
                    // actualizacion
                    note.novedad = novedadc.text;
                    note.codigo = codigoc.text;
                    note.nombre = nombrec.text;
                    note.codDescrip = codDescripc.text;
                    note.cargo = cargoc.text;
                    note.correo = correc.text;
                    note.depenD = depenDc.text;
                    note.codOper = codOperc.text;
                    note.operResp = operRespc.text;
                    Operation.update(note);
                  } else {
                    // insercion
                    Operation.insert(Note(
                      novedad: novedadc.text,
                      codigo: codigoc.text,
                      nombre: nombrec.text,
                      codDescrip: codDescripc.text,
                      cargo: cargoc.text,
                      correo: correc.text,
                      depenD: depenDc.text,
                      codOper: codOperc.text,
                      operResp: operRespc.text,
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
                      child: Text('Si'),
                    )
                  ],
                ))) ??
        false;
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

  Container _textocodigo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.45,
      child: const Text(' Código: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoNovedad(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Novedad ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoNombre(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Funcionario Responsable: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textocodDescrip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.45,
      child: const Text('Descripción Dependencia: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  // Container _textTelefono(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
  //     width: MediaQuery.of(context).size.width * 0.45,
  //     child: const Text('Telefono: ',
  //         style: TextStyle(
  //             fontSize: 21,
  //             color: Color.fromARGB(255, 0, 51, 78),
  //             fontWeight: FontWeight.bold)),
  //   );
  // }

  Container _textocargo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Cargo Funcionario: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textooperResp(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Operador Responsable: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

//inpusttt
  Container _Novedad() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 4,
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
          controller: novedadc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  Container _codigo() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tiene que colocar un telefono";
                }
                return null;
              },
              controller: codigoc,
              style: const TextStyle(
                fontSize: 14,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: ' '),
            ),
          ),
          Expanded(
              child: Ink(
                  decoration: const ShapeDecoration(
                      color: Color.fromARGB(255, 29, 73, 219),
                      shape: CircleBorder()),
                  child: Transform(
                    transform: Matrix4.rotationY(3.6),
                    alignment: Alignment.topCenter,
                    child: IconButton(
                        padding: EdgeInsets.all(0.20),
                        color: Color.fromARGB(255, 200, 202, 204),
                        icon: Icon(Icons.search),
                        onPressed: (() {})),
                  )))
        ]));
  }

  Container _Nombre() {
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
          controller: codDescripc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ' '),
        ));
  }

  Container _codDescrip() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 0.6),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tiene que colocar un telefono";
                }
                return null;
              },
              controller: codigoc,
              style: const TextStyle(
                fontSize: 14,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: ' '),
            ),
          ),
          Expanded(
              child: Ink(
            decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 29, 73, 219), shape: CircleBorder()),
            child: Transform(
              transform: Matrix4.rotationY(3.6),
              alignment: Alignment.topCenter,
              child: IconButton(
                  padding: EdgeInsets.all(0.20),
                  color: Color.fromARGB(255, 200, 202, 204),
                  icon: Icon(Icons.search),
                  onPressed: (() {})),
            ),
          ))
        ]));
  }

  Container _depenD() {
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
          controller: cargoc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
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
          controller: correc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ' '),
        ));
  }

  Container _cargo() {
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
          controller: codOperc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  Container _operResp() {
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
          controller: operRespc,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ''),
        ));
  }

  Container _codOper() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.fromLTRB(0.8, 0.8, 0, 0),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 6000,
        width: 6000,
        child: Row(children: [
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tiene que colocar un telefono";
                }
                return null;
              },
              controller: codigoc,
              style: const TextStyle(
                fontSize: 14,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: ' '),
            ),
          ),
          Expanded(
              child: Ink(
            decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 29, 73, 219), shape: CircleBorder()),
            child: Transform(
              transform: Matrix4.rotationY(3.6),
              alignment: Alignment.topCenter,
              child: IconButton(
                  padding: EdgeInsets.all(0.20),
                  color: Color.fromARGB(255, 200, 202, 204),
                  icon: Icon(Icons.search),
                  onPressed: (() {})),
            ),
          ))
        ]));
  }
}
