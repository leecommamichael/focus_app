import 'dart:async';

import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  TimerButton({Key key}) : super(key: key);

  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  @override
  Widget build(BuildContext context) {
    //Starting or resuming the thing?
    //onPause
    //onBegin
    return RaisedButton(
      child: Text('Go'),
      onPressed: () {},
    );
  }
}

class ClockDisplay extends StatefulWidget {
  final Duration timeToFocus;
  ClockDisplay({Key key, @required this.timeToFocus}) : super(key: key);

  @override
  _ClockDisplayState createState() => _ClockDisplayState(timeLeft: timeToFocus);
}

class _ClockDisplayState extends State<ClockDisplay> {
  Duration timeLeft;
  Timer clockTimer;
  _ClockDisplayState({@required this.timeLeft}) : super();
  // bool get outOfTime => timeLeft.inSeconds == 0;
  int get secondsOnClock => timeLeft.inSeconds - (timeLeft.inMinutes * 60);
  String get secondsDisplay => '${secondsOnClock < 10 ? 0 : ''}$secondsOnClock';

  @override
  void initState() {
    const oneSecond = 1;
    clockTimer = Timer.periodic(Duration(seconds: oneSecond), (t) {
      setState(() {
        timeLeft = Duration(seconds: timeLeft.inSeconds - oneSecond);
      });
    });
    Timer(widget.timeToFocus, () {
      clockTimer.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Starting or resuming the thing?
    //onPause
    //onBegin
    return RaisedButton(
      child: Text('${timeLeft.inMinutes}:$secondsDisplay'),
      onPressed: () {},
    );
  }
}
