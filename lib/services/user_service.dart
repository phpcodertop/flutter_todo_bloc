import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_todo/services/db_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

class UserService {

  Future<int> create(User user) async {
    final db = await DbHelper().database;
    return await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<bool> emailExists(String email) async {
    final db = await DbHelper().database;
    final users = await db.query('users', where: 'email = ?', whereArgs: [email]);
    if(users.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<User> getByEmail(String email) async {
    final db = await DbHelper().database;
    final userMap = await db.query('users', orderBy: 'id', where: 'email = ?', whereArgs: [email], limit: 1);
    return User(
      id: userMap[0]['id'] as int,
      username: userMap[0]['username'] as String,
      email: userMap[0]['email'] as String,
      password: userMap[0]['password'] as String,
      createdAt: userMap[0]['created_at'].toString(),
      updatedAt: userMap[0]['updated_at'].toString(),
    );
  }

  Future<dynamic> canLoginUsingEmailAndPassword(String email, String password) async {
    final db = await DbHelper().database;
    final userMap = await db.query('users', orderBy: 'id', where: 'email = ?', whereArgs: [email], limit: 1);
    if(userMap.isEmpty) {
      return false;
    }
    String userPassword = userMap[0]['password'] as String;
    String hashedPassword = md5
        .convert(utf8.encode(password))
        .toString();
    if(userPassword != hashedPassword) {
      return false;
    }
    return User(
      id: userMap[0]['id'] as int,
      username: userMap[0]['username'] as String,
      email: userMap[0]['email'] as String,
      password: userMap[0]['password'] as String,
      createdAt: userMap[0]['created_at'].toString(),
      updatedAt: userMap[0]['updated_at'].toString(),
    );
  }

  Future<List<User>> getAll() async {
    final db = await DbHelper().database;
    final usersMap = await db.query('users', orderBy: 'id');

    return usersMap.map((userItem) {
      return User(
        id: userItem['id'] as int,
        username: userItem['username'] as String,
        email: userItem['email'] as String,
        password: userItem['password'] as String,
        createdAt: userItem['created_at'].toString(),
        updatedAt: userItem['updated_at'].toString(),
      );
    }).toList();
  }

  Future<User> getById(int id) async {
    final db = await DbHelper().database;
    final userMap = await db.query('users', orderBy: 'id', where: 'id = ?', whereArgs: [id], limit: 1);
    return User(
      id: userMap[0]['id'] as int,
      username: userMap[0]['username'] as String,
      email: userMap[0]['email'] as String,
      password: userMap[0]['password'] as String,
      createdAt: userMap[0]['created_at'].toString(),
      updatedAt: userMap[0]['updated_at'].toString(),
    );
  }

  Future<int> update(int id, Map<String, dynamic> data) async {
    final db = await DbHelper().database;
    return await db.update('users', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final db = await DbHelper().database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
