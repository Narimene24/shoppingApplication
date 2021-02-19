
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseConnection {
  setDatabase () async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join (directory.path, 'db_klausse');
    var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabase );
    return database;
  }
  
  _onCreatingDatabase (Database database, int version) async {
    await database.execute("CREATE TABLE user(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, emailAddress TEXT, password TEXT");
  }
}