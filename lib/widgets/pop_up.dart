import 'package:flutter/material.dart';
import 'package:jornada_troy_ferramentas/widgets/buttons.dart';
import 'package:jornada_troy_ferramentas/widgets/container.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../app/app_theme/app_theme.dart';
import '../app/telas/configuracoes/configuracoes_page.dart';

Future getLoading(BuildContext context) {

  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          height: 150,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.threeArchedCircle(color: themeProvider.isDarkMode ? Colors.white : Colors.blue.shade900, size: 50),
              getSizedBoxVertical(),
              text('Carregando...',  bold: true, fontSize: 20, color: themeProvider.isDarkMode ? Colors.white : Colors.blue.shade900),
            ],
          ),
        ),
      );
    },
  );
}

void sairDaConta(BuildContext context) async {
  await getSairConta(context);
}

Future getPopupExcluirConta(BuildContext context, {void Function()? functionSim}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          height: 250,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text('Excluir conta'.toUpperCase(), bold: true, color: Colors.black, textAlign: TextAlign.center, fontSize: 17),
                getSizedBoxVertical(),
                getContainerDefault(
                  padding: 10,
                  radius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                  child: text('Todos os seus dados de usuario e comparacoes serão apagadas.', textAlign: TextAlign.center, color: Colors.blue.shade900, bold: true)
                ),
                getSizedBoxVertical(),
                getElevatedButton(context, texto: 'SIM', color: Colors.red, function: () => {
                  sairDaConta(context),
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: CadastroPageWidget())),
                }, width: 260, textColor: Colors.white),
                getSizedBoxVertical(),
                getElevatedButton(context, texto: 'NAO', color: Colors.blue.shade900, function: () => Navigator.pop(context), width: 260, textColor: Colors.white),
              ],
            ),
          ),
        ),
      );
    },
  );
}
