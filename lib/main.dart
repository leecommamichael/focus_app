import 'package:flutter/material.dart';
import './task_page/task_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskPage(),
      // home: TaskPage(),
    );
  }
}
