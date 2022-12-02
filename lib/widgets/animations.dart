import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

Widget animateThisWidget({int? tempoDeduracao, int? espere, bool? vertical, Widget? child}) {
  return ShowUpAnimation(
    animationDuration: Duration(seconds: tempoDeduracao ??  1),
    delayStart: Duration(milliseconds: espere ?? 0),
    curve: Curves.bounceIn,
    direction: vertical == true ? Direction.vertical : Direction.horizontal,
    child: child ?? Container(),
  );
}
