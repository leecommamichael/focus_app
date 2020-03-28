import 'package:flutter/material.dart';
import 'package:focus_app/timer_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const help = 'What are you working on?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).focusedChild?.unfocus();
        },
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClockDisplay(timeToFocus: Duration(minutes: 3, seconds: 22)),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: help,
                    hasFloatingPlaceholder: true,
                  ),
                ),
                SizedBox(height: 32),
                TimerButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
