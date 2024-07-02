part of 'todos_bloc.dart';

@immutable
sealed class TodosEvent {}

class AddTodos extends TodosEvent{
  final String todo;
  AddTodos({required this.todo});
}

class RemoveTodos extends TodosEvent{
  final int index;
  RemoveTodos({required this.index});
}
