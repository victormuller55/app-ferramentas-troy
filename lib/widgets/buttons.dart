import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';

Widget getElevatedButton(
  BuildContext context, {
  double? width,
  double? height,
  Color? color,
  void Function()? function,
  String? texto,
  Color? textColor,
  int? milliseconds,
  int? seconds,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) => color ?? HexColor('030045')),
            overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) => Colors.blue.shade900),
            fixedSize: MaterialStateProperty.resolveWith<Size?>((Set<MaterialState> states) => Size(width ?? MediaQuery.of(context).size.width, 50)),
          ),
          child: text(texto?.toUpperCase() ?? '', bold: true, color: textColor ?? Colors.white, fontSize: 17),
        ),
      );
    },
  );
}
