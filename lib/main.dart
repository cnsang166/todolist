import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(Todo());

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoMain(),
    );
  }
}

class TodoMain extends StatelessWidget{
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

class TodoBody extends StatefulWidget {
  double width;
  double height;

  TodoBody({this.width, this.height});

  @override
  TodoBodyState createState() => TodoBodyState();
}

class TodoBodyState extends State<TodoBody> {
  String todoTxt = '';
  TextEditingController _controller;
  List<String> todoList = new List();

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
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          SizedBox(height:5),
          Row(
            children: <Widget>[
              SizedBox(width:5),
              Container(
                width: widget.width - 100,
                child: TextField(
                  controller: _controller,
                  decoration: new InputDecoration(
                    hintText: '여기에 입력',
                  border: OutlineInputBorder(),
                  ),
                  onSubmitted: (String str) {
                    if(str.isNotEmpty) {
                      todoList.add(str);
                      _controller.clear();
                    } else {
                      Fluttertoast.showToast(
                          msg: "Input your todo context",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blueGrey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  }
                ),
              ),
              SizedBox(width: 5),
              RaisedButton(
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    if(_controller.text.isNotEmpty) {
                      todoList.add(_controller.text);
                      _controller.clear();
                    } else {
                      Fluttertoast.showToast(
                          msg: "Input your todo context",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blueGrey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  });
                },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ListTile(todoText: todoList[index], index: index,);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListTile extends StatefulWidget{
  String todoText = '';
  int index;

  ListTile({this.todoText, this.index});

  @override
  ListTileState createState() => ListTileState();
}

class ListTileState extends State<ListTile> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10),
        Expanded(
          child: Text(
            widget.todoText,
            style: TextStyle(fontSize: 18, color: Colors.grey, decoration: flag ? TextDecoration.lineThrough : TextDecoration.none),
          ),
        ),
        SizedBox(width:5),
        RaisedButton(
          child: Icon(Icons.done),
          onPressed: () {
            setState(() {
              flag = flag ? false : true;
            });
          },
        ),
        SizedBox(width: 5),
        RaisedButton(
          child: Icon(Icons.clear),
          onPressed: () {

          },
        ),
      ],
    );
  }
}