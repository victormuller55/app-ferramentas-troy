import 'package:flutter/material.dart';
import 'package:jornada_troy_ferramentas/app/telas/entrar/entrar_bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/entrar/entrar_event.dart';
import 'package:jornada_troy_ferramentas/app/telas/entrar/entrar_page.dart';
import 'package:jornada_troy_ferramentas/models/usuario_model.dart';
import 'package:jornada_troy_ferramentas/widgets/credenciais.dart';
import 'package:jornada_troy_ferramentas/widgets/modal_sheet.dart';
import 'package:jornada_troy_ferramentas/widgets/scaffold.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/opcao.dart';
import '../../app_theme/app_theme.dart';
import '../../app_theme/app_theme_button.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {


  _body() {
    return Column(
      children: [
        AppThemeButton().getCardTheme(context),
        getOpcao(context, title: 'Excluir conta', color: Colors.black, function: () => showModalExcluirConta(context)),
        getOpcao(
          context,
          title: 'Sair da conta',
          color: Colors.red,
          function: () => showModalSairConta(
            context,
            function: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EntrarPage())),
              sairDaConta(),
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return getScaffoldDefault(
      bodyColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
      title: 'Configurações',
      body: _body(),
    );
  }
}

getSairConta(BuildContext context) async {
  UsuarioModel entrarModel = await getCrendeciais();
  EntrarBloc entrarBloc = EntrarBloc();
  entrarBloc.add(ExcluirContaEvent(entrarModel: entrarModel));
}

void sairDaConta() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
}
