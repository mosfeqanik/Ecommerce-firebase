import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wowsell/model/Product_List.dart';

class DatabaseHelper {
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'productList.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE addToCart(id INTEGER PRIMARY KEY AUTOINCREMENT,productName TEXT,productImg TEXT, productPrice TEXT)"
          "");
    });
  }

  Future<int> addProductToCart(ProductList product) async {
    final db = await initDatabase();
    return db.insert('addToCart', product.toMap());
  }

  Future<List<ProductList>> fetchProductAddToCardList() async {
    final db = await initDatabase();
    final maps = await db.query('addToCart');

    return List.generate(maps.length, (index) {
      return ProductList(
        id: maps[index]['id'],
        productName: maps[index]['productName'],
        productImg: maps[index]['productImg'],
        productPrice: maps[index]['productPrice'],
      );
    });
  }

  Future<int> deleteProduct(int id) async {
    final db = await initDatabase();
    return await db.delete('addToCart', where: "id = ?", whereArgs: [id]);
  }

}
