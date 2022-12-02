import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../app/app_theme/app_theme.dart';

Widget getOpcao(BuildContext context, {required String title, Color? color, void Function()? function, Widget? trailing}) {

  final themeProvider = Provider.of<ThemeProvider>(context);

  return Padding(
    padding: const EdgeInsets.only(top: 2),
    child: ListTile(
      tileColor: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white,
      onTap: function ?? () => {},
      title: Text(title, style: TextStyle(color: themeProvider.isDarkMode ? Colors.white :HexColor('030045'), fontWeight: FontWeight.bold, fontFamily: 'source')),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, color: themeProvider.isDarkMode ? Colors.white :HexColor('030045')),
    ),
  );
}
