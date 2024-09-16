import 'package:flutter_todo/models/todo_item.dart';

abstract class TodoEvent {
  const TodoEvent();
}

class TodoLoadingEvent extends TodoEvent {}

class TodoLoadedEvent extends TodoEvent{
  final List<TodoItem> todos;

  TodoLoadedEvent({required this.todos});
}

class CategoryTodoLoadingEvent extends TodoEvent{
  final List<TodoItem> todos = [];
  final String category;
  CategoryTodoLoadingEvent(this.category);
}

class CategoryTodoLoadedEvent extends TodoEvent{
  final List<TodoItem> todos;
  final String category;

  CategoryTodoLoadedEvent({required this.todos, required this.category});
}