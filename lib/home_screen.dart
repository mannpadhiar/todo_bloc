import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/Bloc/auth_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state as AuthSuccess;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        children: [
          Center(child: Text(authState.uid),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            context.read<AuthBloc>().add(AuthLogOutRequested());
          }, child: Text('Log Out')),
        ],
      ),
    );
  }
}
