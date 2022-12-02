import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/resultados_page/resultados_page.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:jornada_troy_ferramentas/widgets/container.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../app/app_theme/app_theme.dart';
import 'navigator.dart';

Widget getComponenteComparacaoHorizontal(BuildContext context, {required HistoricoModel model, Color? color, double? radius, double? padding, double? height}) {
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

  return ShowUpAnimation(
    animationDuration: const Duration(milliseconds: 500),
    direction: Direction.vertical,
    child: Padding(
      padding: EdgeInsets.only(top: padding ?? 10),
      child: getContainerDefault(
        height: height,
        radius: BorderRadius.circular(10),
        color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white,
        child: Center(
          child: ListTile(
            onTap: () => open(context, ResultadosPage(historicoModel: model, isComparacao: false)),
            title: text(model.nomeEmpresa!, fontSize: 16),
            subtitle: text(model.dataHora!, color: Colors.grey, fontSize: 14),
            trailing: Icon(Icons.arrow_forward_ios, color: themeProvider.isDarkMode ? Colors.white : HexColor('030045')),
          ),
        ),
      ),
    ),
  );
}
