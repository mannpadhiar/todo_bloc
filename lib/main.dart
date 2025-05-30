import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/Bloc/auth_bloc.dart';
import 'package:todo_bloc/cubit/counter_cubit.dart';
import 'package:todo_bloc/cubit/cubit_home_page.dart';
import 'package:todo_bloc/home_page.dart';
import 'package:todo_bloc/logIn_page.dart';
import 'package:todo_bloc/modules/todo_modules.dart';
import 'package:todo_bloc/temp.dart';
import 'package:todo_bloc/todo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoCubit(),),
        BlocProvider(create: (_) => IsUpdated(),),
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => AuthBloc(),)
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          // home: HomePage(),
          home: LoginPage(),
        ),
    );
  }
}

