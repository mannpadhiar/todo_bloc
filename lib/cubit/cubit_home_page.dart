import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/cubit/counter_cubit.dart';

class CubitHomePage extends StatefulWidget {
  const CubitHomePage({super.key});

  @override
  State<CubitHomePage> createState() => _CubitHomePageState();
}

class _CubitHomePageState extends State<CubitHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cubit Todo'),),
      body: Column(
        children: [

          //Bloc builder is called multiple times when Bloc builder is executed....
          //so don't use navigation or popUp in the BlocBuilder
          
          BlocBuilder<CounterCubit,CounterState>(builder: (context, state) {
            return Text(state.counterValue.toString());
          },),
          Row(
            children: [
              ElevatedButton(onPressed: () {
                BlocProvider.of<CounterCubit>(context).increment();
              }, child: Icon(Icons.add)),
              ElevatedButton(onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              }, child: Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
  }
}
