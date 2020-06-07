import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/data/model/todo.dart';

class TodoHomeScreen extends StatefulWidget {
  FirebaseUser _user;

  TodoHomeScreen(this._user, {Key key}) : super(key: key);

  @override
  _TodoHomeScreenState createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        addTask(Todo(id: 2, title: 'hello', color: 'Colors.white', tasks: {
          "wash dishes": false,
          "have bath": false,
          "dinner": true,
          "hello": false
        }));
      },
      child: Text(
        'Add',
        style: TextStyle(),
      ),
    );
  }

  void addTask(Todo todo) {
    Firestore.instance
        .collection("TodoApp")
        .document(widget._user.uid)
        .collection("Tasks")
        .add(todo.toMap())
        .then((value) => print("done"));
  }
}
