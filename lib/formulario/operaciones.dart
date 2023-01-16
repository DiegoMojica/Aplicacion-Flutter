// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario/datos.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class Operation {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'note.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE note (id INTEGER PRIMARY KEY, nombre TEXT, edad TEXT, telefono TEXT, correo TEXT, fecha TEXT, )",
      );
    }, version: 1);
  }

  static Future<int> insert(Note note) async {
    Database database = await _openDB();

    return database.insert("note", note.toMap());
  }

  static Future<int> delete(Note note) async {
    Database database = await _openDB();

    return database.delete("note", where: 'id = ?', whereArgs: [note.id]);
  }

  static Future<int> update(Note note) async {
    Database database = await _openDB();

    return database
        .update("note", note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  static Future<List<Note>> notes() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> notesMap = await database.query("note");

    for (var n in notesMap) {
      print("____" + n['nombre']);
    }

    return List.generate(
        notesMap.length,
        (i) => Note(
              id: notesMap[i]['id'],
              nombre: notesMap[i]['nombre'],
              edad: notesMap[i]['edad'],
              telefono: notesMap[i]['telefono'],
              correo: notesMap[i]['correo'],
              fecha: notesMap[i]['fecha'],
            ));
  }
}
