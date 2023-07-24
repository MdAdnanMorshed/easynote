import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/easynote_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => EasynoteCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController noteController=TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: noteController,),
            ),
            SizedBox(width: 350,child: ElevatedButton(onPressed: ()=>BlocProvider.of<EasynoteCubit>(context).addNote(noteController.text),
            child: const Text('Add New Note '),
            ),),
            Expanded(
              child: BlocBuilder<EasynoteCubit, EasynoteInitial>(
                builder: (context, state) {
                  return ListView.builder(
                      itemCount: state.notes.length,
                      itemBuilder: (_, index) {
                        var data = state.notes[index];
                        return ListTile(
                            onTap: ()=>BlocProvider.of<EasynoteCubit>(context).removeNote(index),
                            title: Text(data.toString()),
                            trailing: Icon(Icons.remove_circle,color: Colors.red,),
                        );
                      });
                },
              ),
            ),
          ],
        ));
  }
}
