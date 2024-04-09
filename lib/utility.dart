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
      CREATE TABLE Note (
        id INTEGER PRIMARY KEY,
        title TEXT,
        note TEXT,
        time TEXT
      )
    ''');
    print("I;ve been called");
    await db.execute('''
      CREATE TABLE Task (
        id INTEGER PRIMARY KEY,
        title TEXT,
        time TEXT,
        status INTEGER
      )
    ''');
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> delete(String table, int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table, orderBy: 'time');
  }

  Future<List<Map<String, dynamic>>> queryOneRow(String table, int id) async {
    Database db = await instance.database;
    return await db.query(table,
        where: "id = ?", whereArgs: [id], orderBy: 'time', limit: 1);
  }

  Future<int> update(String table, Map<String, dynamic> row, int id) async {
    Database db = await instance.database;
    int newStatus = row['status'];
    return await db.rawUpdate(
        "UPDATE $table SET status = ? WHERE id = ?", [newStatus, id]);
  }

  Future<int> deleteAll(String table) async {
    Database db = await instance.database;
    return await db.delete(table);
  }
}
