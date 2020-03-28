import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart' show required;

//I don't really need this, but from an analytics perspective it'd be good to know how long of breaks they're taking
class PausableTimer {
  final Stopwatch _stopwatch;
  final Duration maxRunningTime;
  final void Function() onTick;
  final void Function() onTimeElapsed;

  bool get _finalTickOfTimer =>
      _stopwatch.elapsedTicks == maxRunningTime.inSeconds + 1;

  PausableTimer(
      {@required this.maxRunningTime,
      @required this.onTick,
      this.onTimeElapsed})
      : _stopwatch = Stopwatch()..start() {
    Timer.periodic(Duration(seconds: 1), (t) {
      if (_finalTickOfTimer) {
        onTick();
        onTimeElapsed?.call();
        _stopwatch.stop();
        t.cancel();
      } else if (_stopwatch.isRunning) {
        onTick();
      }
    });
  }

  void pause() {
    _stopwatch.stop();
  }

  void resume() {
    _stopwatch.start();
  }
}
//Tree as a set of focuses. Every time you divert from the initial focus, it becomes a node in a tree. DISTRACTION TREE
