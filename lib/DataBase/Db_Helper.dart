import 'package:amit_project/Database/DbModuls.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper{
  static final DbHelper dbHelper=DbHelper.internal();
  factory DbHelper()=>dbHelper;
  DbHelper.internal();
  Database _db;

  Future<Database> CreateDatabBase()async{
    if(_db!=null){
      return _db;
    }
    String path= join(await getDatabasesPath(),'cart.db');

    _db= await openDatabase(path,version: 1,onCreate: (db, version) {
      db.execute("create table CartProducts (id integer primary key autoincrement,image varchar(200),name varchar(100),title varchar(100),amount integer,price integer,total integer,inStock integer)");
    },);
    print('the database is created : $_db');
    return _db;
  }
  Future<int>insertData(DbModel product)async{
    Database db=await CreateDatabBase();
    return db.insert('CartProducts', product.toMap());
  }

  Future<List<DbModel>>getData()async{
    Database db=await CreateDatabBase();
    List<DbModel> list=[];
    for(var item in await db.query('CartProducts')){
      list.add(DbModel.fromMap(item));
    }
    return list;
  }
  Future<int> deleteProduct(id)async{
    Database db= await CreateDatabBase();
    db.delete('CartProducts',where: 'id=?',whereArgs: [id]);
  }

}