import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/Bloc/auth_bloc.dart';
import 'package:todo_bloc/logIn_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: BlocConsumer<AuthBloc,AuthState>(
        builder: (context, state){
          if(state is AuthLoading){
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Center(child: Text((state as AuthSuccess).uid),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                context.read<AuthBloc>().add(AuthLogOutRequested());
              }, child: Text('Log Out')),
            ],
          );
        },
        listener: (context, state){
          if(state is AuthInitial) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
          }
        },
      ),
    );
  }
}
