import 'package:krunch_app/Models/products.dart';
import 'package:sqflite/sqflite.dart';

abstract class Database {
  static var db;

  static initializeDatabase() async {
    db = await openDatabase('products.db');

    await db.execute(
        'CREATE TABLE IF NOT EXISTS favourites (barcodeNumber TEXT PRIMARY KEY, title TEXT, description TEXT, images TEXT, rating TEXT)');
  }

  static Future<void> insert(Product product) async {
    await db.insert(
      'favourites',
      product.toDatabaseMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Product>> getFavoritesFromDatabase() async {
    final List<Map<String, dynamic>> favoriteMaps =
        await db.query('favourites');

    return favoriteMaps.map((map) => Product.fromDatabaseMap(map)).toList();
  }
}
