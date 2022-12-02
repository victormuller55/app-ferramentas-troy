import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

import '../../widgets/text.dart';
import 'app_theme.dart';

class AppThemeButton {
  ThemeProvider themeProvider = ThemeProvider();

  getCardTheme(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 50,
      color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white,
      child: Center(
        child: ListTileSwitch(
          value: themeProvider.isDarkMode,
          onChanged: (bool value) async {
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.toggleTheme(value);
          },
          visualDensity: VisualDensity.comfortable,
          switchType: SwitchType.cupertino,
          switchActiveColor: themeProvider.isDarkMode ? Colors.black : Colors.blue.shade900,
          title: text(themeProvider.isDarkMode ? "Modo claro" : "Modo escuro", fontSize: 17, color: themeProvider.isDarkMode ? Colors.white : Colors.blue.shade900, bold: true),
        ),
      ),
    );
  }
}
