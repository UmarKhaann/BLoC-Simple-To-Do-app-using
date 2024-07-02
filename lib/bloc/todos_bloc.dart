import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosInitial> {
  TodosBloc() : super(TodosInitial()) {
    on<AddTodos>((event, emit) {
      final List<String> newList = state.todos + [event.todo];
      emit(TodosInitial(todos: newList));
    });
    on<RemoveTodos>((event, emit) {
      state.todos.removeAt(event.index);
      final List<String> newList = state.todos;
      
      emit(TodosInitial(todos: newList));
    });
  }
}
