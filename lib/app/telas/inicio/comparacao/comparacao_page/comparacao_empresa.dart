import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jornada_troy_ferramentas/app/app_theme/app_theme.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_event.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/empresa_model.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:jornada_troy_ferramentas/widgets/buttons.dart';
import 'package:jornada_troy_ferramentas/widgets/drawer.dart';
import 'package:jornada_troy_ferramentas/widgets/erro_componente.dart';
import 'package:jornada_troy_ferramentas/widgets/navigator.dart';
import 'package:jornada_troy_ferramentas/widgets/notification.dart';
import 'package:jornada_troy_ferramentas/widgets/scaffold.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../form_fields/text_form_field_double.dart';
import '../../../../../form_fields/text_form_field_int.dart';
import '../../../../../form_fields/text_form_field_text.dart';
import '../comparacao_state.dart';
import 'comparacao_atual.dart';

class ComparacaoEmpresa extends StatefulWidget {
  const ComparacaoEmpresa({Key? key}) : super(key: key);

  @override
  State<ComparacaoEmpresa> createState() => _ComparacaoEmpresaState();
}

class _ComparacaoEmpresaState extends State<ComparacaoEmpresa> {
  ComparacaoBloc bloc = ComparacaoBloc();

  TextFormFieldText controllerNome = TextFormFieldText('', hintText: 'Nome da empresa');
  TextFormFieldInt controllerCNPJ = TextFormFieldInt('', hintText: 'CNPJ', isCNPJ: true);
  TextFormFieldText controllerNomeDaMaquina = TextFormFieldText('', hintText: 'Nome da maquina');
  TextFormFieldText controllerMaterial = TextFormFieldText('', hintText: 'Material');
  TextFormFieldText controllerDescricaoDaOperacao = TextFormFieldText('', hintText: 'Descrição da comparacao');
  TextFormFieldInt controllerNumeroDaMaquina = TextFormFieldInt('', hintText: 'Número da maquina');
  TextFormFieldInt controllerAISI = TextFormFieldInt('', hintText: 'AISI');
  DoubleFormField controllerComprimentoDoFuro = DoubleFormField(0, hintText: 'Comprimento do Furo', labelText: 'Comprimento do Furo', symbol: '(mm)');
  TextFormFieldInt controllerNumeroDeFuros = TextFormFieldInt('', hintText: 'Número de furos');

  String dropdownValue = 'Nenhum';
  EmpresaModel empresaModel2 = EmpresaModel(cnpj: '', nomeEmpresa: '');

  List<TextEditingController> list = [];

  @override
  void initState() {
    bloc.add(EmpresasLoadEvent());
    super.initState();
  }

  void onChangeDropdown(String? value) {
    setState(() {
      dropdownValue = value!;
      if (dropdownValue != 'Nenhum') {
        Future.delayed(const Duration(milliseconds: 100)).then((value) {
          controllerNome.updateValue(empresaModel2.nomeEmpresa!);
          controllerCNPJ.updateValue(empresaModel2.cnpj!);
        });
      } else {
        controllerNome.updateValue('');
        controllerCNPJ.updateValue('');
      }
    });
  }

  void save() {
    if (controllerNome.unformattedValue.isEmpty || controllerCNPJ.unformattedValue.isEmpty || controllerNomeDaMaquina.unformattedValue.isEmpty || controllerMaterial.unformattedValue.isEmpty || controllerAISI.unformattedValue.isEmpty || controllerDescricaoDaOperacao.unformattedValue.isEmpty || controllerComprimentoDoFuro.unformattedValue.toString().isEmpty || controllerNumeroDeFuros.unformattedValue.isEmpty) {
      getAvisoPopup(context, mensagem: 'Preencha todos os campos!', color: Colors.orange, icon: Icons.warning);
    } else {
      EmpresaModel empresaModel = EmpresaModel(
        nomeEmpresa: controllerNome.formattedValue,
        cnpj: controllerCNPJ.formattedValue,
      );

      if (empresaModel2.nomeEmpresa == '') {
        bloc.add(EmpresasSaveEvent(empresaModel));
        bloc.add(EmpresasLoadEvent());
      }

      HistoricoModel contaModel = HistoricoModel(
        nomeEmpresa: controllerNome.formattedValue,
        cnpj: controllerCNPJ.formattedValue,
        nomeMaquina: controllerNomeDaMaquina.formattedValue,
        numeroMaquina: controllerNumeroDaMaquina.unformattedValue,
        material: controllerMaterial.formattedValue,
        aisi: controllerAISI.unformattedValue,
        comprimentoDoFuro: controllerComprimentoDoFuro.unformattedValue.toString(),
        numeroDeFuros: controllerNumeroDeFuros.unformattedValue,
      );

      open(context, ComparacaoAtualPage(contaModel: contaModel));
    }
  }

  Widget title({required String title}) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: text(title, bold: true, fontSize: 15),
    );
  }

  Widget dropdown(List<EmpresaModel> listaEmpresa) {
    List<DropdownMenuItem<String>> empresas = [];

    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    for (EmpresaModel empresaModel in listaEmpresa) {
      if (dropdownValue == 'Nenhum') {
        empresaModel2 = EmpresaModel(cnpj: '', nomeEmpresa: '');
      }

      if (empresaModel.nomeEmpresa == dropdownValue) {
        empresaModel2 = empresaModel;
      }

      empresas.add(DropdownMenuItem(value: empresaModel.nomeEmpresa, child: text(empresaModel.nomeEmpresa!, color: themeProvider.isDarkMode ? Colors.white : Colors.grey.shade600)));
    }

    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem(value: 'Nenhum', child: text('Nenhum', color: themeProvider.isDarkMode ? Colors.white : Colors.grey.shade600)),
        ...empresas,
      ],
      onChanged: (value) => onChangeDropdown(value),
      value: dropdownValue,
      borderRadius: BorderRadius.circular(10),
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration: InputDecoration(
        filled: true,
        fillColor: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide:  BorderSide(width: 0.5, color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide:  BorderSide(width: 0.5, color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide:  BorderSide(width: 0.5, color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white)),
      ),
    );
  }

  Widget saveButtom({required String title, void Function()? function}) {
    return Center(
      child: getElevatedButton(
        context,
        function: function,
        texto: 'Preencher dados do concorrente',
        width: MediaQuery.of(context).size.width - 16,
      ),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(title: 'Empresa e Maquina'),
          _blocBuilder(),
          getSizedBoxVertical(),
          controllerNome.formField,
          controllerCNPJ.formField,
          controllerNomeDaMaquina.formField,
          controllerNumeroDaMaquina.formField,
          title(title: 'Dados da comparação'),
          controllerDescricaoDaOperacao.formField,
          controllerMaterial.formField,
          controllerAISI.formField,
          controllerComprimentoDoFuro.formField,
          controllerNumeroDeFuros.formField,
          saveButtom(title: 'Preenchar dados do concorrente', function: () => save()),
        ],
      ),
    );
  }

  Widget _blocBuilder() {
    return BlocBuilder<ComparacaoBloc, ComparacaoState>(
      bloc: bloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case ComparacaoLoadingState:
            return Center(child: LoadingAnimationWidget.newtonCradle(color: Colors.blue.shade900, size: 60));

          case ComparacaoSuccessState:
            return dropdown(state.empresaModelList ?? []);

          case ComparacaoErrorState:
            return getErroTentarNovamente(function: () => bloc.add(EmpresasLoadEvent()));

          default:
            return dropdown(state.empresaModelList ?? []);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return getScaffoldDefault(
      drawer: getDrawerPrincipal(context),
      title: 'Empresa (Comparação)',
      body: _body(),
      bodyColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade300,
    );
  }
}
