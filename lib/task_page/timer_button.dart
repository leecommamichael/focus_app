import 'package:flutter/material.dart';
import 'package:focus_app/task_page/pausable_timer.dart';

class ClockDisplay extends StatefulWidget {
  final Duration timeToFocus;
  ClockDisplay({Key key, @required this.timeToFocus}) : super(key: key);

  @override
  _ClockDisplayState createState() => _ClockDisplayState(timeLeft: timeToFocus);
}

class _ClockDisplayState extends State<ClockDisplay> {
  Duration timeLeft;
  PausableTimer clockTimer;

  _ClockDisplayState({@required this.timeLeft}) : super();
  double get progressBarPortion =>
      timeLeft.inMilliseconds / widget.timeToFocus.inMilliseconds;
  int get secondsOnClock => timeLeft.inSeconds - (timeLeft.inMinutes * 60);
  String get secondsDisplay => '${secondsOnClock < 10 ? 0 : ''}$secondsOnClock';
  String get timerDisplay => '${timeLeft.inMinutes}:$secondsDisplay';

  void f(Duration d) {
    setState(() {
      timeLeft = d;
    });
  }

  @override
  void initState() {
    clockTimer = PausableTimer(
      maxRunningTime: timeLeft,
      onTick: f,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).buttonColor,
        child: InkWell(
            child: Column(children: <Widget>[
              Text(
                timerDisplay,
                style: Theme.of(context).textTheme.display4,
              ),
              SizedBox(
                  height: 16,
                  child: LinearProgressIndicator(
                    value: progressBarPortion,
                    backgroundColor: Colors.transparent,
                  ))
            ]),
            onTap: () {
              clockTimer.toggle();
            }));
  }

  @override
  void dispose() {
    // clockTimer.stop();
    // clockTimer = null;
    super.dispose();
  }
}
