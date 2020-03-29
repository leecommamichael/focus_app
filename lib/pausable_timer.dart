import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart' show required;

//I don't really need this, but from an analytics perspective it'd be good to know how long of breaks they're taking
// TODO(mike): I probably need to ignore time before start
class PausableTimer {
  final Stopwatch _stopwatch;
  final Duration maxRunningTime;
  final void Function(Duration) onTick;
  final void Function() onTimeElapsed;

  int get secondsLeft =>
      maxRunningTime.inSeconds - _stopwatch.elapsed.inSeconds;
  bool get _finalTickOfTimer =>
      _stopwatch.elapsed.inSeconds == maxRunningTime.inSeconds + 1;

  PausableTimer(
      {@required this.maxRunningTime,
      @required this.onTick,
      this.onTimeElapsed})
      : _stopwatch = Stopwatch() {
    Timer.periodic(Duration(seconds: 1), (t) {
      if (_finalTickOfTimer) {
        onTick(Duration(seconds: 0));
        onTimeElapsed?.call();
        _stopwatch.stop();
        t.cancel();
      } else if (_stopwatch.isRunning) {
        onTick(Duration(seconds: secondsLeft));
      }
    });
  }

  void toggle() {
    if (_stopwatch.isRunning)
      _stopwatch.stop();
    else if (secondsLeft != 0) _stopwatch.start();
  }

  void start() {
    _stopwatch.start();
  }

  void stop() {
    _stopwatch.stop();
  }
}
//Tree as a set of focuses. Every time you divert from the initial focus, it becomes a node in a tree. DISTRACTION TREE
