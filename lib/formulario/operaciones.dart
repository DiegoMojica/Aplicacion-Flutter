// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario/datos.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class Operation {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'datos.db'),
        onCreate: (db, version) {
      return db.execute('''
CREATE TABLE datos (
  id INTEGER PRIMARY KEY, 
  novedad TEXT, 
  codigo TEXT, 
  nombre TEXT, 
  codDescrip TEXT, 
  cargo TEXT, 
  correo TEXT, 
  telefono TEXT, 
  usuario TEXT, 
  operResp TEXT, 
  )
      ''');
    }, version: 1);
  }

  static Future<int> insert(Note notes) async {
    Database database = await _openDB();

    return database.insert("datos", notes.toMap());
  }

  static Future<int> delete(Note notes) async {
    Database database = await _openDB();

    return database.delete("datos", where: 'id = ?', whereArgs: [notes.id]);
  }

  static Future<int> update(Note notes) async {
    Database database = await _openDB();

    return database
        .update("datos", notes.toMap(), where: 'id = ?', whereArgs: [notes.id]);
  }

  static Future<List<Note>> notes() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> datossMap = await database.query("datos");

    for (var n in datossMap) {
      print("__" + n['nombre']);
    }

    return List.generate(
        datossMap.length,
        (i) => Note(
              id: datossMap[i]['id'],
              novedad: datossMap[i]['novedad'],
              codigo: datossMap[i]['codigo'],
              nombre: datossMap[i]['nombre'],
              codDescrip: datossMap[i]['codDescrip'],
              cargo: datossMap[i]['cargo'],
              depenD: datossMap[i]['depenD'],
              correo: datossMap[i]['correo'],
              codOper: datossMap[i]['codOper'],
              operResp: datossMap[i]['operResp'],
            ));
  }
}
