import 'package:basic_todolist/todobody.dart';
import 'package:basic_todolist/todoprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(Todo());

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoList()),
      ],
      child: MaterialApp(
        home: TodoMain(),
      ),
    );
  }
}

class TodoMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: TodoBody(width: _width, height: _height),
    );
  }
}

