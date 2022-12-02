import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/telas/configuracoes/configuracoes_page.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_page/comparacao_empresa.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/dashboard/dashboard_page.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_page.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/inicio/inicio_page.dart';
import 'package:jornada_troy_ferramentas/widgets/modal_sheet.dart';
import 'package:jornada_troy_ferramentas/widgets/navigator.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';

import '../app/telas/entrar/entrar_page.dart';

Widget componenteDrawer(BuildContext context, {required IconData icon, required String title, required Widget openPage, void Function()? function}) {
  return ListTile(
    onTap: function ?? () => open(context, openPage),
    leading: Icon(icon, color: Colors.white, size: 25),
    title: text(title, fontSize: 18, color: Colors.white),
    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
  );
}

Widget getDrawerPrincipal(BuildContext context) {
  return Drawer(
    backgroundColor: HexColor('030045'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: 150,
              child: Image.asset('assets/images/troy2.png'),
            ),
          ),
        ),
        componenteDrawer(context, title: 'Início', icon: Icons.home, openPage: const InicioPage()),
        componenteDrawer(context, title: 'Comparações', icon: Icons.compare_arrows_sharp, openPage: const ComparacaoEmpresa()),
        componenteDrawer(context, title: 'Dashboard', icon: Icons.bar_chart, openPage: const DashboardPage()),
        componenteDrawer(context, title: 'Histórico', icon: Icons.history, openPage: const HistoricoPage()),
        componenteDrawer(context, title: 'Configurações', icon: Icons.settings, openPage: const ConfiguracoesPage()),
        componenteDrawer(
          context,
          title: 'Sair da conta',
          icon: Icons.logout,
          openPage: const ConfiguracoesPage(),
          function: () => showModalSairConta(
            context,
            function: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EntrarPage())),
              sairDaConta(),
            },
          ),
        ),
      ],
    ),
  );
}
