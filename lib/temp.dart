import 'dart:async';

import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {

  TextEditingController textEditingController = TextEditingController();
  StreamController<String> streamController = StreamController<String>();

  Stream<int> numberStream() async* {
    for(int i=0;i<5;i++){
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Streams in flutter'),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(snapshot.data.toString());
                }else{
                  return Text('Initial');
                }
              }
            ),
            const SizedBox(height: 20,),
            SizedBox(width:200,child: TextField(controller: textEditingController,)),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              streamController.add(textEditingController.text);
            }, child: Text('Done!!')),

            const SizedBox(height: 30,),
            StreamBuilder(stream: numberStream(), builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else if(snapshot.hasData){
                return Text('data : ${snapshot.data}');
              }
              else{
                return Text('None');
              }
            },)
          ],
        ),
      ),
    );
  }
}
