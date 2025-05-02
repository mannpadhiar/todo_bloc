import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/modules/todo_modules.dart';

// class Todo{
//   final String title;
//   Todo(this.title);
// }
//
// class TodoState{
//   final List<Todo> todos;
//   TodoState({required this.todos});
// }
//
// sealed class TodoEvent{}
//
// class AddTodo extends TodoEvent{}
//
// class CancelTodo extends TodoEvent{}
//
// class TodoBloc extends Bloc<TodoEvent,TodoState>{
//   TodoBloc() : super((todos: [])){
//     on<AddTodo>((event, emit)TodoState {
//
//     },);
//   }
// }


class TodoCubit extends Cubit<List<Todo>>{
  TodoCubit() : super([]);

  void addTodo(String title){
    final todo = Todo(title: title, createdAt: DateTime.now());

    state.add(todo);
    print('todo added!!!');
    emit([...state]);
  }
  
  void removeTodo(String title,DateTime cDate){
    final updatedList = List<Todo>.from(state);
    updatedList.removeWhere((todo) => todo.title == title && todo.createdAt == cDate,);
    emit(updatedList);
  }

  void updateTodo(String oldTitle,DateTime oldCDate,String newTitle,DateTime newCDate,){
    final mainList = List<Todo>.from(state);
    final index = mainList.indexWhere(
          (todo) => todo.title == oldTitle && todo.createdAt == oldCDate,
    );
    mainList[index] = Todo(title: newTitle,createdAt: newCDate);
    emit(mainList);
  }
}

class IsUpdated extends Cubit<bool>{
  IsUpdated() : super(false);

  void setIsUpdated(bool update){
    emit(update);
  }
}