import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/app_theme/app_theme.dart';
import 'package:jornada_troy_ferramentas/app/telas/configuracoes/configuracoes_page.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_page/comparacao_empresa.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/resultados_page/resultados_page.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/dashboard/dashboard_page.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_page.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:jornada_troy_ferramentas/models/usuario_model.dart';
import 'package:jornada_troy_ferramentas/widgets/container.dart';
import 'package:jornada_troy_ferramentas/widgets/credenciais.dart';
import 'package:jornada_troy_ferramentas/widgets/drawer.dart';
import 'package:jornada_troy_ferramentas/widgets/erro_componente.dart';
import 'package:jornada_troy_ferramentas/widgets/imagens.dart';
import 'package:jornada_troy_ferramentas/widgets/navigator.dart';
import 'package:jornada_troy_ferramentas/widgets/scaffold.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:provider/provider.dart';

import '../historico/historico_event.dart';
import '../historico/historico_state.dart';
import 'graficos.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  UsuarioModel usuarioModel = UsuarioModel.empty();
  HistoricoBloc bloc = HistoricoBloc();

  void credenciais() async {
    usuarioModel = await getCrendeciais();
    Future.delayed(const Duration(milliseconds: 20)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    credenciais();
    bloc.add(LoadHistoricoEvent());
    super.initState();
  }

  Widget appBar() {
    return Stack(
      children: [
        getContainerDefault(
          height: 150,
          width: MediaQuery.of(context).size.width,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HexColor('030045'),
              Colors.blue.shade900,
            ],
          ),
        ),
        Opacity(
          opacity: 0.05,
          child: getContainerDefault(
            height: 150,
            width: MediaQuery.of(context).size.width,
            image: const NetworkImage('https://media.gazetadopovo.com.br/2021/07/21125502/Nichele-possibilita-aquisi%C3%A7%C3%A3o-de-caixa-de-ferramentas-completa-pelo-WhatsApp.-960x540.jpg'),
          ),
        ),
        getImagemLogo(paddingTop: 40)
      ],
    );
  }

  Widget grafico() {
    return getContainerDefault(
      color: Colors.white,
      padding: 10,
      radius: BorderRadius.circular(10),
      child: const SizedBox(height: 200, child: GraficosInicio()),
    );
  }

  Widget _componentesAtalho({required String title, required Icon icon, required Widget page}) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        getContainerDefault(
          padding: 15,
          onTap: () => open(context, page),
          color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white,
          child: icon,
          radius: BorderRadius.circular(10),
        ),
        getSizedBoxVertical(),
        text(title),
      ],
    );
  }

  Widget _componenteComparacao(HistoricoModel historicoModel) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: getContainerDefault(
        width: MediaQuery.of(context).size.width,
        color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white,
        onTap: () => open(context, ResultadosPage(historicoModel: historicoModel, isComparacao: false)),
        boxShadow: [
          BoxShadow(
            color: themeProvider.isDarkMode ? Colors.black : Colors.grey.shade300,
            blurRadius: 30,
            offset: const Offset(10, 10),
          ),
        ],
        radius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListTile(
            title: text(historicoModel.nomeEmpresa ?? '', fontSize: 15),
            subtitle: text(historicoModel.dataHora ?? '', fontSize: 13, color: Colors.grey),
            trailing: const Icon(Icons.arrow_forward_ios, size: 15),
          ),
        ),
      ),
    );
  }

  Widget componentesComparacao(List<HistoricoModel> historicoModel) {
    if (historicoModel.isNotEmpty) {
      List<Widget> dataHoje = [];

      for (HistoricoModel dados in historicoModel.reversed) {
        dataHoje.add(_componenteComparacao(dados));
      }

      return Column(children: dataHoje);
    } else {
      return SizedBox(
        height: 100,
        child: Center(child: text('Nenhum registro encontrado.')),
      );
    }
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBar(),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getSizedBoxVertical(height: 20),
              SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _componentesAtalho(title: 'Comparacao', icon: const Icon(Icons.compare_arrows), page: const ComparacaoEmpresa()),
                      _componentesAtalho(title: 'Historico', icon: const Icon(Icons.history), page: const HistoricoPage()),
                      _componentesAtalho(title: 'Dashboards', icon: const Icon(Icons.bar_chart), page: const DashboardPage()),
                      _componentesAtalho(title: 'Configuracoes', icon: const Icon(Icons.settings), page: const ConfiguracoesPage()),
                    ],
                  ),
                ),
              ),
              getSizedBoxVertical(height: 10),
              text('Ultimas comparações', bold: true),
              getSizedBoxVertical(height: 10),
              _blocBuilder(),
            ],
          ),
        )
      ],
    );
  }

  Widget _blocBuilder() {
    return BlocBuilder<HistoricoBloc, HistoricoState>(
      bloc: bloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HistoricoLoadingState:
            return SizedBox(
              height: 300,
              child: getLoadingWithoutPopup(context),
            );

          case HistoricoSuccessState:
            return componentesComparacao(state.contaModel);

          case HistoricoErrorState:
            return SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: getErroTentarNovamente(function: () => bloc.add(LoadHistoricoEvent())),
            );

          default:
            return componentesComparacao(state.contaModel);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return getScaffoldDefault(
      title: 'Olá, ${usuarioModel.nome}',
      bodyColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
      drawer: getDrawerPrincipal(context),
      actions: [
        IconButton(onPressed: () => open(context, const ConfiguracoesPage()), icon: const Icon(Icons.settings)),
      ],
      body: _body(),
    );
  }
}
