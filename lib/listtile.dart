import 'package:basic_todolist/todoprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListChild extends StatefulWidget {
  String todoText = '';
  int index;

  ListChild({this.todoText, this.index});

  @override
  ListTileState createState() => ListTileState();
}

class ListTileState extends State<ListChild> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    TodoList todo = Provider.of<TodoList>(context);

    return Row(
      children: <Widget>[
        SizedBox(width: 10),
        Expanded(
          child: Text(
            widget.todoText,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                decoration:
                    flag ? TextDecoration.lineThrough : TextDecoration.none),
          ),
        ),
        SizedBox(width: 5),
        SizedBox(
            width: 45,
            child: Center(
              child: RaisedButton(
                child: Icon(
                  Icons.done,
                  size: 16,
                ),
                onPressed: () {
                  setState(() {
                    flag = flag ? false : true;
                  });
                },
              ),
            )),
        SizedBox(width: 5),
        SizedBox(
          width: 45,
          child: Center(
            child: RaisedButton(
              child: Icon(
                Icons.clear,
                size: 16,
              ),
              onPressed: () {
                todo.delData(widget.index);
              },
            ),
          ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
