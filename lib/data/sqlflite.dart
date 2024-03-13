import '/../core/model/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDB {
  static Database? _db;

  Future<Database?> get db async {
    _db ??= await intialDB();
    return _db;
  }

  intialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'expense.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, onUpgrade: _onUpgrade, version: 1);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {}

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "user" (
    "username" TEXT PRIMARY KEY,
    "password" TEXT NOT NULL
    )
    ''');
  }

  Future<UserModel?> getUser(String username) async {
    final Database? mydb = await db;
    final List<Map<String, Object?>>? users = await mydb?.query('user',
        columns: ['username', 'password'],
        where: 'username = ?',
        whereArgs: [username]);

    if (users!.isEmpty) {
      return null;
    } else {
      return UserModel(
          username: users.first['username'] as String,
          password: users.first['password'] as String);
    }
  }

  Future<int?> insertUser(UserModel user) async {
    final Database? mydb = await db;
    return await mydb?.insert("user", user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.fail);
  }
}
