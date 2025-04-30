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

  String updateTitle = '';
  DateTime updateCurrentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsUpdated,bool>(
      builder: (context, isUpdated) => Scaffold(
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
                isUpdated?BlocProvider.of<TodoCubit>(context).updateTodo(updateTitle, updateCurrentDate, titleController.text, DateTime.now())
                    :BlocProvider.of<TodoCubit>(context).addTodo(titleController.text.trim());
                titleController.clear();
                BlocProvider.of<IsUpdated>(context).setIsUpdated(false);
              },
              child: Text(isUpdated? 'Update':'ADD'),
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

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                              BlocProvider.of<TodoCubit>(context).removeTodo(todo.title, todo.createdAt);
                            }, icon: Icon(Icons.delete)),

                            IconButton(onPressed: () {
                              titleController.text = todo.title;
                              updateTitle = todo.title;
                              updateCurrentDate = todo.createdAt;
                              BlocProvider.of<IsUpdated>(context).setIsUpdated(true);
                            }, icon: Icon(Icons.edit)),
                          ],
                        )
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
