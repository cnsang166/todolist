import 'package:basic_todolist/todoprov.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'listtile.dart';

class TodoBody extends StatefulWidget {
  double width;
  double height;

  TodoBody({this.width, this.height});

  @override
  TodoBodyState createState() => TodoBodyState();
}

class TodoBodyState extends State<TodoBody> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TodoList todo = Provider.of<TodoList>(context);

    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              SizedBox(width: 5),
              Expanded(
                child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '여기에 입력',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (String str) {
                      if (str.isNotEmpty) {
                        todo.setData(str);
                        _controller.clear();
                      } else {
                        Fluttertoast.showToast(
                            msg: "Input your todo context",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }),
              ),
              SizedBox(width: 5),
              SizedBox(
                width: 45,
                child: Center(
                  child: RaisedButton(
                    child: Icon(
                      Icons.add,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_controller.text.isNotEmpty) {
                          todo.setData(_controller.text);
                          _controller.clear();
                        } else {
                          Fluttertoast.showToast(
                              msg: "Input your todo context",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blueGrey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todo.getTotal(),
              itemBuilder: (context, index) {
                return ListChild(
                  todoText: todo.getData(index),
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
