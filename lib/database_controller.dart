import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/content_item.dart';

//final String tableName = 'CH_CONTENTS';

class DatabaseController {

  static late Database _db;

  Database get db{
    return _db;
  }

  Future<bool> initDataBase() async{
    var databasePath = await getDatabasesPath();
    var dataPath = join(databasePath, 'cherry_contents.db');
    _db = await openDatabase(dataPath, version:1, onCreate: _onCreateWordTable);
    return true;
  }

  /*
         * ==============================
         *  CH_CONTENTS
         * ==============================
         *  id INTEGER PK AUTOINCREMENT
         *  word TEXT
         *  mean TEXT
         *  expr TEXT
         * ==============================
         */
  Future<void> _onCreateWordTable(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${ContentItemDbInfo.table} (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        word TEXT, 
        mean TEXT, 
        expr TEXT
        )
        ''');
  }
}

