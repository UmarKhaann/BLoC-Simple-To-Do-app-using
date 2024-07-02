import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_using_bloc/bloc/todos_bloc.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  final todoController = TextEditingController();

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Simple To-Do App'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: todoController,
                  decoration: const InputDecoration(
                    label: Text("What's on your mind?"),
                    contentPadding: EdgeInsets.zero
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<TodosBloc>()
                        .add(AddTodos(todo: todoController.text));
                    todoController.clear();
                  },
                  child: const Icon(Icons.send)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<TodosBloc, TodosInitial>(
              builder: (context, state) {
                if (state.todos.isEmpty) {
                  return const Center(child: Text("There isn't anything to do"));
                }
                return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final reveredIndex = (state.todos.length - index) - 1;
                      return Card(
                        child: ListTile(
                          title: Text(state.todos[reveredIndex]),
                          
                          trailing: IconButton(
                              onPressed: () {
                                context
                                    .read<TodosBloc>()
                                    .add(RemoveTodos(index: reveredIndex));
                              },
                              icon: const Icon(Icons.close)),
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
