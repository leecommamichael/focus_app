import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// cameraZoom is bounded by maxZoom and minZoom which are dev simplifications and can change.
/// cameraPosition depends on the zoom level.
/// cameraPosition of 0,0 means centered.
class PannableZoomableContainer extends StatefulWidget {
  PannableZoomableContainer({this.child});
  final Widget child;

  @override
  _PannableZoomableContainerState createState() =>
      _PannableZoomableContainerState();
}

class _PannableZoomableContainerState extends State<PannableZoomableContainer> {
  _PannableZoomableContainerState({
    this.cameraPosition = const Offset(0, 0),
    this.cameraZoom = 1,
  });
  Offset cameraPosition;
  final double cameraZoom;
  void onPanStart(DragStartDetails start) {
    print('START');
  }

  void onScaleUpdate(ScaleUpdateDetails update) {
    print('Local:${update.localFocalPoint}\tGlobal:${update.focalPoint}');
    setState(() {
      cameraPosition = update.localFocalPoint;
    });
  }

  void onPanEnd(DragEndDetails end) {
    print('EsND');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onScaleStart: onPanStart,
      onScaleUpdate: onScaleUpdate,
      // onScaleEnd: onPanEnd,
      child: Container(
        color: Colors.green,
        child: Transform(
          transform: Matrix4.translationValues(
              cameraPosition.dx, cameraPosition.dy, 0),
          child: Container(
            width: 20,
            height: 20,
            color: Colors.red,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
