import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_theme/app_theme.dart';

Widget text(
  String text, {
  Color? color,
  double? fontSize,
  bool? overflow,
  bool? bold,
  double? letterSpacing,
  String? fontFamily,
  TextAlign? textAlign,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

      Color colorText = Colors.black;

      if (color == null) {
        colorText = themeProvider.isDarkMode ? Colors.white : Colors.black;
      } else {
        colorText = color;
      }

      return Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          color: colorText,
          fontSize: fontSize ?? 15,
          overflow: overflow == true ? TextOverflow.ellipsis : null,
          fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily ?? 'source',
        ),
      );
    },
  );
}
