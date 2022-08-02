import 'package:crypto_app/coin.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'crypto_database.db'),
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE currency(id TEXT PRIMARY KEY,name TEXT,symbol TEXT, imageUrl TEXT, marketcap INTEGER, pricechange INTEGER,changePercentage INTEGER)');
        return;
      },
      version: 1,
    );
  }

  Future<int> insertData(Coin coin) async {
    var dataid = 0;
    Database _db = await database();
    _db
        .insert('currency', coin.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      dataid = value;
    });
    return dataid;
  }

  Future<List<Coin>> getData() async {
    Database _db = await database();
    List<Map<String, dynamic>> dataMap = await _db.query('currency');
    return List.generate(dataMap.length, (index) {
      return Coin(
          name: dataMap[index]['name'],
          symbol: dataMap[index]['symbol'],
          imageUrl: dataMap[index]['imageUrl'],
          marketcap: dataMap[index]['marketcap'],
          pricechange: dataMap[index]['pricechange'],
          changePercentage: dataMap[index]['changePercentage']);
    });
  }

  Future<void> DeleteData(int id) async {
    Database _db = await database();
    await _db.rawDelete("delete from currency where id='$id'");
  }
}
