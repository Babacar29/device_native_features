import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;

class DBHelper{
  static Future<void> insert() async{
    final dbPath = await sqlite.getDatabasesPath();
    return sqlite.openDatabase(
      path.join(dbPath, 'Places.db'),
      onCreate: (db, version){
        return db.execute("CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)");
      },
      version: 1
    );
  }

  /*static Future<void> insert(String table, Map<String, Object> data) async{
    final db = await DBHelper.database();
    db.insert(table, data, conflictAlgorithm: sqlite.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> get(String table) async{
    final db = await DBHelper.database();
    db.query(table);
  }*/
}