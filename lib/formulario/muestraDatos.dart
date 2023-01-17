import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario/datos.dart';
import 'package:flutter_application_1/formulario/form.dart';
import 'package:flutter_application_1/formulario/operaciones.dart';

class ListPage extends StatelessWidget {
  static const String ROUTE = "/lista";

  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _MyList();
  }
}

class _MyList extends StatefulWidget {
  @override
  __MyListState createState() => __MyListState();
}

class __MyListState extends State<_MyList> {
  List<Note> notes = [];

  @override
  void initState() {
    _loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 29, 73, 219),
        onPressed: () {
          Navigator.pushNamed(context, SavePage.ROUTE, arguments: Note.empty())
              .then((value) => setState(
                    () {
                      _loadData();
                    },
                  ));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Registros"),
        backgroundColor: const Color.fromARGB(255, 29, 73, 219),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, i) => _createItem(i),
      ),
    );
  }

  _loadData() async {
    List<Note> auxNote = await Operation.notes();

    setState(() {
      notes = auxNote;
    });
  }

  _createItem(int i) {
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(left: 5),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) {
        print(direction);
        Operation.delete(notes[i]);
      },
      child: ListTile(
        title: Text(notes[i].novedad),
        trailing: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, SavePage.ROUTE, arguments: notes[i])
                .then((value) => setState(
                      () {
                        _loadData();
                      },
                    ));
          },
          child: Ink(
              padding: const EdgeInsets.all(5),
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 29, 73, 219),
                shape: CircleBorder(),
              ),
              child: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
