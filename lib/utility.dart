import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null we instantiate it
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = p.join(await getDatabasesPath(), 'your_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Task (
        id INTEGER PRIMARY KEY,
        title TEXT,
        time TEXT,
        status INTEGER
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print(row);
    return await db.insert('Task', row);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete('Task', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query('Task', orderBy: 'time');
  }

  Future<int> update(Map<String, dynamic> row, int id) async {
    Database db = await instance.database;
    int newStatus = row['status'];
    return await db
        .rawUpdate("UPDATE Task SET status = ? WHERE id = ?", [newStatus, id]);
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete('Task');
  }
}
