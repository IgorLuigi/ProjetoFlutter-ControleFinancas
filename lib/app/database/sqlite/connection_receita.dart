
import 'package:app/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConnectionReceita{
  static Database _db;

  static Future<Database> get()async{
    if(_db==null){
      var path = join(await getDatabasesPath(), 'bancofinancas');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v){
          db.execute(criarTabelaReceita);
          db.execute(insert1);
          db.execute(insert2);
        },
      );
    }
    return _db;
  }



}