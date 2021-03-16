import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:catat_uang/models/kategori.dart';
import 'package:catat_uang/models/log_uang.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'keuangan.db';
    var keuanganDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return keuanganDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE kategori (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        jenis TEXT,
        nama TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE log_uang (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tanggal DATE,
        masuk TEXT,
        keluar TEXT,
        kategori INTEGER,
        FOREIGN KEY (kategori) REFERENCES kategori(id)
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  //Create (C)
  Future<int> insertKategori(Kategori object) async {
    Database db = await this.database;
    int count = await db.insert('kategori', object.toMap());
    return count;
  }

  Future<int> insertLog(Log_uang object) async {
    Database db = await this.database;
    int count = await db.insert('log_uang', object.toMap());
    return count;
  }

  //Read (R)
  Future<List<Map<String, dynamic>>> selectKategori() async {
    Database db = await this.database;
    var count = await db.query('kategori', orderBy: 'nama');
    return count;
  }

  Future<List<Map<String, dynamic>>> selectLog() async {
    Database db = await this.database;
    var count = await db.query('log_uang', orderBy: 'tanggal');
    return count;
  }

  //Update (U)
  Future<int> updateKategori(Kategori object) async {
    Database db = await this.database;
    int count = await db.update('kategori', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  Future<int> updateLog(Kategori object) async {
    Database db = await this.database;
    int count = await db.update('log_uang', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //Delete (D)
  Future<int> deleteKategori(int id) async {
    Database db = await this.database;
    int count = await db.delete('kategori', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<int> deleteLog(int id) async {
    Database db = await this.database;
    int count = await db.delete('log_uang', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Kategori>> getKategoriList() async {
    var kategoriMapList = await selectKategori();
    int count = kategoriMapList.length;
    List<Kategori> contactList = List<Kategori>();
    for (int i = 0; i < count; i++) {
      contactList.add(Kategori.fromMap(kategoriMapList[i]));
    }
    return contactList;
  }

  Future<List<Log_uang>> getLogList() async {
    var logMapList = await selectLog();
    int count = logMapList.length;
    // ignore: deprecated_member_use
    List<Log_uang> contactList = List<Log_uang>();
    for (int i = 0; i < count; i++) {
      contactList.add(Log_uang.fromMap(logMapList[i]));
    }
    return contactList;
  }
}
