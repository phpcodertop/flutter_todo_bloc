import 'package:sqflite/sqflite.dart';

import '../models/todo_item.dart';
import 'db_helper.dart';


class TodoService {

  Future<int> create(TodoItem todo) async {
    final db = await DbHelper().database;
    return await db.insert('todos', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<List<TodoItem>> getAll() async {
    final db = await DbHelper().database;
    final todosMap = await db.query('todos', orderBy: 'id');

    return todosMap.map((todoItem) {
      return TodoItem(
        id: todoItem['id'] as int,
        content: todoItem['content'] as String,
        userId: todoItem['user_id'] as int,
        category: todoItem['category'] as String,
        createdAt: todoItem['created_at'].toString(),
        updatedAt: todoItem['updated_at'].toString(),
      );
    }).toList();
  }

  Future<TodoItem> getById(int id) async {
    final db = await DbHelper().database;
    final todoMap = await db.query('todos', orderBy: 'id', where: 'id = ?', whereArgs: [id], limit: 1);
    return TodoItem(
      id: todoMap[0]['id'] as int,
      category: todoMap[0]['category'] as String,
      userId: todoMap[0]['user_id'] as int,
      content: todoMap[0]['content'] as String,
      createdAt: todoMap[0]['created_at'].toString(),
      updatedAt: todoMap[0]['updated_at'].toString(),
    );
  }

  Future<List<TodoItem>> getByCategory(String category) async {
    final db = await DbHelper().database;
    final todosMap = await db.query('todos', orderBy: 'id', where: 'category = ?', whereArgs: [category], limit: 1);

    return todosMap.map((todoItem) {
      return TodoItem(
        id: todoItem['id'] as int,
        content: todoItem['content'] as String,
        userId: todoItem['user_id'] as int,
        category: todoItem['category'] as String,
        createdAt: todoItem['created_at'].toString(),
        updatedAt: todoItem['updated_at'].toString(),
      );
    }).toList();
  }

  Future<int> update(int id, Map<String, dynamic> data) async {
    final db = await DbHelper().database;
    return await db.update('todos', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final db = await DbHelper().database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

}