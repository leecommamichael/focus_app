import 'package:flutter/material.dart';
import 'package:focus_app/task_page/timer_button.dart';

class TaskPage extends StatefulWidget {
  TaskPage({Key key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  static const help = 'What are you working on?';

  Widget _subjectField() => FractionallySizedBox(
        widthFactor: 9 / 10,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            labelText: help,
            hasFloatingPlaceholder: true,
          ),
        ),
      );
  Widget _completeButton() => RaisedButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check),
            SizedBox(width: 14),
            Text("TASK COMPLETE"),
          ],
        ),
        onPressed: () {},
      );
  Widget _blockedButton() => RaisedButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline),
            SizedBox(width: 14),
            Text("I HIT A BLOCKER"),
          ],
        ),
        onPressed: () {},
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).focusedChild?.unfocus();
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClockDisplay(timeToFocus: Duration(minutes: 3, seconds: 22)),
                _subjectField(),
                _completeButton(),
                _blockedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
