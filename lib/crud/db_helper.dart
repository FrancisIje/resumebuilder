import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // If the database doesn't exist, create it.
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String databasePath = join(await getDatabasesPath(), 'my_database.db');
    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        // Create your tables here.
        db.execute('''
        CREATE TABLE Profiles (
          id TEXT PRIMARY KEY,
          name TEXT,
          address TEXT,
          email TEXT,
          phone TEXT,
          image BLOB,
          education TEXT,
          experience TEXT,
          skills TEXT,
          objective TEXT,
        )
      ''');
      },
    );
  }

  // Implement methods for CRUD operations.
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>?> query(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> update(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db
        .update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<int> delete(String table, int id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
