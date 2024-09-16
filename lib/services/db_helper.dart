import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  Future<Database> get database async => _initDB();

  Future<Database> _initDB() async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todos.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // execute users table
    await db.execute('CREATE TABLE "users" ( "id" INTEGER NOT NULL, "username" TEXT NOT NULL, "email" TEXT NOT NULL UNIQUE, "password" TEXT NOT NULL, "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY("id" AUTOINCREMENT) )');
    // execute todos table
    return await db.execute('CREATE TABLE "todos" ( "id" INTEGER NOT NULL, "content" TEXT NOT NULL, "user_id" INTEGER NOT NULL, "category" TEXT NOT NULL, "created_At" TIMESTAMP DEFAULT CURRENT_TIMESTAMP, "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY("id" AUTOINCREMENT) )');
  }

}