import 'package:flutter/cupertino.dart';

class TodoList with ChangeNotifier {
  List<String> todo = new List();

  void setData(String _str) {
    todo.add(_str);
    notifyListeners();
  }

  String getData(int _index) {
    String _result = '';
    if (todo.length > 0) {
      _result = todo[_index];
    }
    return _result;
  }

  void delData(int _index) {
    if (todo.length > 0) {
      todo.removeAt(_index);
    }
    notifyListeners();
  }

  getTotal() {
    return todo.length;
  }
}