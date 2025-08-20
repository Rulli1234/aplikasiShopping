// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shopping_app/model/model_pengguna.dart';
import 'package:shopping_app/model/model_shopping.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> databaseHelper() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'Daftar.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE daftar(id INTEGER PRIMARY KEY, username TEXT, email TEXT, password TEXT)',
        );

        await db.execute(
          'CREATE TABLE ShoppingItem(id INTEGER PRIMARY KEY, nama TEXT, jumlah INTEGER, catatan TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertPengguna(Pengguna pengguna) async {
    final db = await databaseHelper();
    await db.insert(
      'daftar',
      pengguna.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Pengguna>> getAllPengguna() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> maps = await db.query('daftar');
    return List.generate(maps.length, (i) => Pengguna.fromMap(maps[i]));
  }

  static Future<void> insertShoppingItem(ShoppingItem shoppingitem) async {
    final db = await databaseHelper();
    await db.insert(
      'ShoppingItem',
      shoppingitem.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<ShoppingItem>> getAllShoppingItem() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> maps = await db.query('ShoppingItem');
    return List.generate(maps.length, (i) => ShoppingItem.fromMap(maps[i]));
  }
}
