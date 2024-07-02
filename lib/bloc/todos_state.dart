part of 'todos_bloc.dart';

@immutable
sealed class TodosState {}

final class TodosInitial extends TodosState {
  final List<String> todos;
  TodosInitial({this.todos = const []});
}
