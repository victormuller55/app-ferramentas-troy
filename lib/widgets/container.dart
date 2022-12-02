import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/app_theme/app_theme.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

Widget getContainerDefault({
  double? padding,
  double? height,
  double? width,
  bool? hasBorder,
  BorderRadiusGeometry? radius,
  Widget? child,
  ImageProvider? image,
  Color? color,
  List<BoxShadow>? boxShadow,
  Gradient? gradient,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap ?? () => {},
    child: Container(
      padding: EdgeInsets.all(padding ?? 0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        boxShadow: boxShadow ?? [],
        borderRadius: radius,
        gradient: gradient,
        border: hasBorder ?? false ? Border.all(color: Colors.grey.shade400, width: 1) : null,
        image: image != null ? DecorationImage(image: image, fit: BoxFit.cover) : null,
      ),
      child: child ?? const SizedBox(),
    ),
  );
}

Widget getFundo(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('000A2E'),
          HexColor('002FD8'),
        ],
      ),
    ),
  );
}

Widget getLoadingWithoutPopup(BuildContext context) {
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height - 140,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingAnimationWidget.threeArchedCircle(color: themeProvider.isDarkMode ? Colors.white : Colors.blue.shade900, size: 50),
        getSizedBoxVertical(),
        text('Carregando...', bold: true, fontSize: 20, color: themeProvider.isDarkMode ? Colors.white : Colors.blue.shade900),
      ],
    ),
  );
}
