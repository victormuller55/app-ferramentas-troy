import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

Widget getImagemLogo({double? paddingTop}) {
  return Center(
    child: Column(
      children: [
        SizedBox(height: paddingTop ?? 25),
        ShowUpAnimation(
          animationDuration: const Duration(milliseconds: 500),
          curve: Curves.bounceIn,
          direction: Direction.vertical,
          offset: 0.5,
          child: SizedBox(
            width: 180,
            child: Image.asset(
              'assets/images/troy2.png',
            ),
          ),
        ),
      ],
    ),
  );
}
