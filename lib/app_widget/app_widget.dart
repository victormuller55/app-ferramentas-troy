import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:jornada_troy_ferramentas/app/telas/entrar/entrar_page.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/inicio/inicio_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app_theme/app_theme.dart';

Widget telaAbrir = const EntrarPage();
bool jaAbriu = false;

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {

    verificaLogin() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getInt('id') != null && !jaAbriu) {
        telaAbrir = const InicioPage();
        setState(() {});
        jaAbriu = true;
      }
    }

    verificaLogin();

    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return InAppNotification(
            child: MaterialApp(
              themeMode: themeProvider.themeMode,
              debugShowCheckedModeBanner: false,
              home: telaAbrir,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
            ),
          );
        });
  }
}
