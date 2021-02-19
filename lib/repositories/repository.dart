import 'package:klausse/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DataBaseConnection _dataBaseConnection;

  Repository() {
    _dataBaseConnection = DataBaseConnection();
  }

  static Database _database;

  // check if database exist or not
  Future<Database> get database async {
  if (_database != null) return _database;
  _database = await _dataBaseConnection.setDatabase();
  return _database;
  }

  // Inserting data to Table
  insertData(table, data) async{
    var connection = await database;
    return await connection.insert(table, data);
  }

  getDataFromDb() async{
    var connection = await database;
    int count = Sqflite
        .firstIntValue(await connection.rawQuery('SELECT COUNT(*) FROM Test'));
  }


}