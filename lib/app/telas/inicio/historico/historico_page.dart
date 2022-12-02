import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_event.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_state.dart';
import 'package:jornada_troy_ferramentas/form_fields/text_form_field_text.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:jornada_troy_ferramentas/widgets/drawer.dart';
import 'package:jornada_troy_ferramentas/widgets/erro_componente.dart';
import 'package:jornada_troy_ferramentas/widgets/notification.dart';
import 'package:jornada_troy_ferramentas/widgets/produtos.dart';
import 'package:jornada_troy_ferramentas/widgets/scaffold.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/container.dart';
import '../../../app_theme/app_theme.dart';

class HistoricoPage extends StatefulWidget {
  final bool? fromInicio;

  const HistoricoPage({Key? key, this.fromInicio}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

List<HistoricoModel> lista = [];
List<HistoricoModel> lista2 = [];

class _HistoricoPageState extends State<HistoricoPage> {

  HistoricoBloc bloc = HistoricoBloc();
  Widget leanding = Container();
  late TextFormFieldText form;

  bool passou1vez = false;

  @override
  void initState() {
    bloc.add(LoadHistoricoEvent());
    form = TextFormFieldText('', onChanged: (value) => search(value), hintText: 'Pesquisar', prefixIcon: Icon(Icons.search));
    super.initState();
  }

  void search(String query) {
    final suggestion = lista.where((element) {
      final caixaTitulo = element.nomeEmpresa?.toLowerCase();
      final input = query.toLowerCase();
      return caixaTitulo!.contains(input);
    }).toList();

    if (query == '') {
      setState(() {
        lista = lista2;
      });
    } else {
      setState(() {
        lista = suggestion;
      });
    }
  }

  _body(List<HistoricoModel> historicoModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          form.formField,
          SizedBox(
            height: 1200,
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final caixa = lista[index];
                return getComponenteComparacaoHorizontal(context, model: caixa);
              },
            ),
          ),
        ],
      ),
    );
  }

  _blocBuilder() {
    return BlocConsumer<HistoricoBloc, HistoricoState>(
      listener: (context, state) {
        state is HistoricoErrorState ? getAvisoPopup(context, mensagem: 'Não foi possivel carregar', color: Colors.red, icon: Icons.close) : null;
        if (state is HistoricoSuccessState) {
          lista = state.contaModel;
          lista2 = state.contaModel;
        }
      },
      bloc: bloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HistoricoLoadingState:
            return getLoadingWithoutPopup(context);

          case HistoricoSuccessState:
            return _body(state.contaModel);

          case HistoricoErrorState:
            return SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: getErroTentarNovamente(function: () => bloc.add(LoadHistoricoEvent())),
            );

          default:
            return _body(state.contaModel);
        }
      },
    );
  }

  Future<void> refresh() async {
    bloc.add(LoadHistoricoEvent());
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return getScaffoldDefault(
      title: 'Histórico',
      bodyColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
      drawer: widget.fromInicio != true ? getDrawerPrincipal(context) : null,
      appBarColor: HexColor('030045'),
      body: _blocBuilder(),
      leading: widget.fromInicio == true ? IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)) : null,
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
