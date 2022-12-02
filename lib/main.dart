import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app_widget/app_widget.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: HexColor('030045'),
    ),
  );

  runApp(const AppWidget());
}
