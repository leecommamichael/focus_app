import 'package:flutter/cupertino.dart';

class TaskNode {
  String title;
  Duration timeWorked;
  List<TaskNode> subTasks;
}

class Task extends StatefulWidget {
  final TaskNode taskNode;
  Task({@required this.taskNode});

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(widget.taskNode.title),
        ],
      ),
    );
  }
}

/**
 * Box
 * line
 * Box
 */
