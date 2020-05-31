import 'package:flutter/material.dart';
import 'package:todoapp/screens/wrapper.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO App',
      home: Wrapper(),
    );
  }
}
