import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const _databaseName = 'shipping_database.db';
  static const _databaseVersion = 1;

  static Database? _database;

  DatabaseProvider._();

  static Future<Database> get database async {
    _database ??= await _initDatabase();

    return _database!;
  }

  static Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }
  static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {

    if (oldVersion < 1) {
    }
  }


  static Future<void> _onCreate(Database db, int version) async {


    await db.execute('''
      CREATE TABLE parentCategory (
        idParentCategory TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        isActive INTEGER
      )
    ''');


  }

  // CRUD operations for parentCategory
  static Future<int> insertParentCategory(Map<String, dynamic> parentCategory) async {
    print("data base.dart , insertParentCategory");
    Database db = await database;
    return await db.insert('parentCategory', parentCategory);
  }

  static Future<List<Map<String, dynamic>>> getAllParentCategories() async {
    Database db = await database;
    return await db.query('parentCategory');
  }




}
