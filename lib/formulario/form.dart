import 'package:flutter/material.dart';

import 'package:flutter_application_1/formulario/datos.dart';
import 'package:flutter_application_1/formulario/operaciones.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../PDF/pdf.dart';

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
            backgroundColor: const Color.fromARGB(255, 29, 73, 219)),
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
      // alignment: Alignment.center,
      width: 450,
      padding: const EdgeInsets.all(50),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              //espacio entre los textos y los container
              height: 30,
            ),
            //Novedad y Codigo
            //Texto's Novedad y Codigo
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: TextDirection.ltr,
                children: [
                  //Novedad Codigo
                  //Texto's Novedad Codigo
                  Expanded(
                    flex: 3,
                    child: _textoNovedad(context),
                  ),
                  Expanded(
                    flex: 3,
                    child: _textocodigo(context),
                  ),
                ]),
            const SizedBox(
              //espacio entre los textos y los container
              height: 5,
            ),
            //Container's Novedad y Codigo
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: _Novedad(),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(flex: 2, child: _codigo()),
                SizedBox(
                  width: 4,
                ),
                Flexible(
                  flex: 1,
                  child: botonCodigo(),
                ),
              ],
            ),
            //Funcionario Responsable
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    flex: 3,
                    child: _textoNombre(context),
                  )
                ]),
            //espacio entre los textos y los container
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: _Nombre(),
                ),
              ],
            ),
            //Descripción Dependencia
            //Texto Descripción Dependencia
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    flex: 3,
                    child: _textocodDescrip(context),
                  )
                ]),
            //espacio entre los textos y los container
            const SizedBox(
              height: 5,
            ),
            //container's CodOper OperResp
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: _codDescrip(),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  flex: 1,
                  child: bottonDescrip(),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(flex: 4, child: _depenD()),
              ],
            ),
            //Correo
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    flex: 3,
                    child: _textoCorreo(context),
                  )
                ]),
            //espacio entre los textos y los container
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: _correo(),
                ),
              ],
            ),
            //Cargo Funcionario
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    flex: 3,
                    child: _textocargo(context),
                  )
                ]),
            const SizedBox(
              //espacio entre los textos y los container
              height: 5,
            ),
            //container Funcionario
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: _cargo(),
                ),
              ],
            ),
            //Operador Responsable
            //Texto Operador Responsable
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    flex: 3,
                    child: _textooperResp(context),
                  )
                ]),
            const SizedBox(
              //espacio entre los textos y los container
              height: 5,
            ),
            //container's CodOper OperResp
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: _codOper(),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  flex: 1,
                  child: bottonoperador(),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(flex: 4, child: _operResp()),
              ],
            ),
            const SizedBox(
              //espacio entre los textos y los container
              height: 90,
            ),
            //botones
            Container(
                width: 45,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 29, 73, 219),
                      child: const Icon(
                        Icons.file_open_rounded,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => PdfPage())));
                      },
                    ),
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 29, 73, 219),
                      child: const Icon(Icons.refresh_outlined, size: 30),
                      onPressed: () => iniFn(),
                    ),
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 29, 73, 219),
                      child: const Icon(
                        Icons.save_as_rounded,
                        size: 25,
                      ),
                      onPressed: () => increaseFn(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

//alert de guardado al salir de la opcion
  Future<bool> _onWillPopScope() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title:
                      const Text('¿Seguro que quieres salir del formulario? '),
                  content: const Text('Tienes datos sin guardar'),
                  actions: [
                    MaterialButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No')),
                    MaterialButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Si'),
                    )
                  ],
                ))) ??
        false;
  }

  Container _textoCorreo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.47,
      child: const Text('Correo: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoNovedad(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      // width: MediaQuery.of(context).size.width * 0.20,
      child: const Text('Novedad ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textocodigo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      // width: MediaQuery.of(context).size.width * 0.20,
      child: const Text(' Código: ',
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 0, 51, 78),
              fontWeight: FontWeight.bold)),
    );
  }

  Container _textoNombre(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
        height: 35,
        width: 250,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
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

  Container _codigo() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      height: 35,
      width: 90,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 200, 202, 204),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(7)),
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      // margin: const EdgeInsets.symmetric(horizontal: 50),
      margin: null,
      child: Expanded(
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
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: ' '),
        ),
      ),
    );
  }

  Container botonCodigo() {
    return Container(
        child: Ink(
            height: 35,
            width: 60,
            decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 29, 73, 219), shape: CircleBorder()),
            child: Transform(
              transform: Matrix4.rotationY(3.6),
              alignment: Alignment.topCenter,
              child: IconButton(
                  padding: const EdgeInsets.all(0.20),
                  color: const Color.fromARGB(255, 200, 202, 204),
                  icon: const Icon(Icons.search),
                  onPressed: (() {})),
            )));
  }

  Container _Nombre() {
    return Container(
        height: 35,
        width: 450,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        height: 35,
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        // padding: const EdgeInsets.symmetric(horizontal: 0.6),
        // margin: const EdgeInsets.symmetric(horizontal: 10),
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
          )
        ]));
  }

  Container bottonDescrip() {
    return Container(
        child: Ink(
            height: 35,
            width: 60,
            decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 29, 73, 219), shape: CircleBorder()),
            child: Transform(
              transform: Matrix4.rotationY(3.6),
              alignment: Alignment.topCenter,
              child: IconButton(
                  padding: const EdgeInsets.all(0.20),
                  color: const Color.fromARGB(255, 200, 202, 204),
                  icon: const Icon(Icons.search),
                  onPressed: (() {})),
            )));
  }

  Container _depenD() {
    return Container(
        height: 35,
        width: 282,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
        height: 35,
        width: 450,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
        height: 35,
        width: 450,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
        height: 35,
        width: 282,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
        height: 35,
        width: 282,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 200, 202, 204),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.fromLTRB(10, 0.8, 0, 0),
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
        ]));
  }

  Container bottonoperador() {
    return Container(
        child: Ink(
            height: 35,
            width: 60,
            decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 29, 73, 219), shape: CircleBorder()),
            child: Transform(
              transform: Matrix4.rotationY(3.6),
              alignment: Alignment.topCenter,
              child: IconButton(
                  padding: const EdgeInsets.all(0.20),
                  color: const Color.fromARGB(255, 200, 202, 204),
                  icon: const Icon(Icons.search),
                  onPressed: (() {})),
            )));
  }

  Widget buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 29, 73, 219),
          child: const Icon(
            Icons.file_open_rounded,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => PdfPage())));
          },
        ),
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 29, 73, 219),
          child: const Icon(Icons.refresh_outlined, size: 30),
          onPressed: () => iniFn(),
        ),
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 29, 73, 219),
          child: const Icon(
            Icons.save_as_rounded,
            size: 25,
          ),
          onPressed: () => increaseFn(),
        ),
      ],
    );
  }

  increaseFn() {}

  iniFn() {}
}
