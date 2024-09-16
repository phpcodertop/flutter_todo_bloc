import 'package:bloc/bloc.dart';
import 'package:flutter_todo/bloc/todo/todo_event.dart';
import 'package:flutter_todo/bloc/todo/todo_state.dart';
import 'package:flutter_todo/models/todo_item.dart';
import 'package:flutter_todo/services/todo_service.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoItem> todos = [];
  List<TodoItem> categoryTodos = [];

  TodoBloc() : super(TodoInitialState()) {
    on<TodoLoadingEvent>((event, emit) async {
      emit(TodoLoadingState());
      TodoService todoService = TodoService();
      List<TodoItem> todosAll = await todoService.getAll();
      todos = todosAll;
      emit(TodoLoadedState(todosAll));
    });

    on<CategoryTodoLoadingEvent>((event, emit) async {
      emit(CategoryTodoLoadingState(event.category));
      TodoService todoService = TodoService();

      List<TodoItem> todos = await todoService.getByCategory(event.category);
      categoryTodos = todos;
      emit(CategoryTodoLoadedState(todos, event.category));
    });
  }
}