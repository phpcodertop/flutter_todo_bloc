import 'package:flutter_todo/models/todo_item.dart';

abstract class TodoState {
  const TodoState();
}

class TodoInitialState extends TodoState {
  final List<TodoItem> todos = [];
}

class TodoLoadingState extends TodoState {
  final List<TodoItem> todos = [];
}

class TodoLoadedState extends TodoState {
  final List<TodoItem> todos;
  const TodoLoadedState(this.todos);
}

class CategoryTodoLoadingState extends TodoState {
  final String category;
  final List<TodoItem> todos = [];
  CategoryTodoLoadingState(this.category);
}

class CategoryTodoLoadedState extends TodoState {
  final List<TodoItem> todos;
  final String category;
  const CategoryTodoLoadedState(this.todos, this.category);
}