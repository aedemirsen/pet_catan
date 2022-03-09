import 'package:flutter/material.dart';

class Util {
//returns position of a widget using GlobalKey
  static List getPosition(GlobalKey gk) {
    List xy = [];
    final RenderBox renderBox =
        gk.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    xy.add(position.dx);
    xy.add(position.dy);
    return xy;
  }
}
