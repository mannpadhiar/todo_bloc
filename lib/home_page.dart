import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/todo_bloc.dart';
import 'package:todo_bloc/modules/todo_modules.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Column(
        children: [
          Text('Enter your todo :'),
          Expanded(
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              print('todo added');
              BlocProvider.of<TodoCubit>(context).addTodo(titleController.text.trim());
              titleController.clear();
            },
            child: Text('ADD')
          ),

          Expanded(
            child: BlocBuilder<TodoCubit,List<Todo>>(
              builder: (context, todos) => ListView.builder(
                itemCount: todos.length,
                itemBuilder : (context, index) {
                  final todo = todos[index];

                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.createdAt.toString()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
