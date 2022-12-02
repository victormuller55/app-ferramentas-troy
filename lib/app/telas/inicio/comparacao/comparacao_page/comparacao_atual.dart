import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/app_theme/app_theme.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_page/comparacao_troy.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:jornada_troy_ferramentas/widgets/buttons.dart';
import 'package:jornada_troy_ferramentas/widgets/container.dart';
import 'package:jornada_troy_ferramentas/widgets/navigator.dart';
import 'package:jornada_troy_ferramentas/widgets/scaffold.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../../../../form_fields/text_form_field_double.dart';
import '../../../../../form_fields/text_form_field_int.dart';
import '../../../../../form_fields/text_form_field_text.dart';

class ComparacaoAtualPage extends StatefulWidget {
  final HistoricoModel contaModel;

  const ComparacaoAtualPage({Key? key, required this.contaModel}) : super(key: key);

  @override
  State<ComparacaoAtualPage> createState() => _ComparacaoAtualPageState();
}

class _ComparacaoAtualPageState extends State<ComparacaoAtualPage> {
  bool valueRefrigeracao = false;

  TextFormFieldText controllerFabricante = TextFormFieldText('', hintText: 'Fabricante');
  TextFormFieldText controllerFixacaoFerramenta = TextFormFieldText('', hintText: 'Fixação da ferramenta');
  TextFormFieldInt controllerCodSuporteDaBroca = TextFormFieldInt('', hintText: 'Código de suporte da broca');
  DoubleFormField controllerAngSuporteDaBroca = DoubleFormField(0, hintText: 'Ângulo de suporte da broca', symbol: '(º)');
  DoubleFormField controllerAngDaBroca = DoubleFormField(0, hintText: 'Ângulo da broca', symbol: '(º)');
  TextFormFieldInt controllerCodInsertoBroca = TextFormFieldInt('', hintText: 'Código de inserto da broca');
  TextFormFieldText controllerClasse = TextFormFieldText('', hintText: 'Classe');
  TextFormFieldInt controllerQuantidadeArestas = TextFormFieldInt('', hintText: 'Quantidade de Arestas', haveInputFormatters: true);
  DoubleFormField controllerDiametroBroca = DoubleFormField(0, hintText: 'Diâmetro da broca', symbol: '(mm)');
  DoubleFormField controllerPressaoRefrigeracao = DoubleFormField(0, hintText: 'Pressão de refrigeração', symbol: '(bars)');
  DoubleFormField controllerVelocidadeDeCorte = DoubleFormField(0, hintText: 'Velocidade de corte', symbol: '(m/mm)');
  DoubleFormField controllerAvancoPorRotacao = DoubleFormField(0, hintText: 'Avanço por rotação', symbol: '(mm/rot)');
  TextFormFieldText controllerRendimentoDePecasPorArestas = TextFormFieldText('', hintText: 'Rendimento de peças por aresta');
  TextFormFieldInt controllerPecasPorAresta = TextFormFieldInt('', hintText: 'Peças por aresta');

  void save() {
    HistoricoModel contaModel = HistoricoModel(
      nomeEmpresa: widget.contaModel.nomeEmpresa,
      nomeMaquina: widget.contaModel.nomeMaquina,
      numeroMaquina: widget.contaModel.numeroMaquina,
      material: widget.contaModel.material,
      aisi: widget.contaModel.aisi,
      comprimentoDoFuro: widget.contaModel.comprimentoDoFuro,
      numeroDeFuros: widget.contaModel.numeroDeFuros,
      cnpj: widget.contaModel.cnpj,
      fabricante: controllerFabricante.unformattedValue,
      fixacaoFerramenta: controllerFixacaoFerramenta.unformattedValue,
      codigoSuporteDaBroca: controllerCodSuporteDaBroca.unformattedValue,
      anguloSuporteDaBroca: controllerAngSuporteDaBroca.unformattedValue.toString(),
      anguloDaBroca: controllerAngDaBroca.unformattedValue.toString(),
      codigoInsertoBroca: controllerCodInsertoBroca.unformattedValue,
      classe: controllerClasse.unformattedValue,
      quantidadeDeArestas: controllerQuantidadeArestas.unformattedValue,
      diametroDaBroca: controllerDiametroBroca.unformattedValue.toString(),
      refrigeracao: valueRefrigeracao ? 'SIM' : 'NAO',
      pressaoDeRefrigeracao: controllerPressaoRefrigeracao.unformattedValue.toString(),
      velocidadeDeCorte: controllerVelocidadeDeCorte.unformattedValue.toString(),
      avancoPorRotacao: controllerAvancoPorRotacao.unformattedValue.toString(),
      rendimentoDePecasPorArestas: controllerRendimentoDePecasPorArestas.unformattedValue,
      pecasPorAresta: controllerPecasPorAresta.unformattedValue,
    );

    open(context, ComparacaoTroy(contaModel: contaModel));
  }

  Widget getCheckBox() {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return getContainerDefault(
      hasBorder: true,
      color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100,
      radius: BorderRadius.circular(5),
      child: Center(
        child: CheckboxListTile(
          title: text('Refrigeração', color: themeProvider.isDarkMode ? Colors.white : Colors.grey),
          activeColor: HexColor('050045'),
          value: valueRefrigeracao,
          onChanged: (value) => setState(() => valueRefrigeracao = !valueRefrigeracao),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getContainerDefault(
            padding: 8,
            width: MediaQuery.of(context).size.width,
            height: 50,
            radius: BorderRadius.circular(10),
            color: HexColor('050045'),
            child: Center(
              child: text('Agora preencha os dados da ferramenta atual.', textAlign: TextAlign.center, color: Colors.white),
            ),
          ),
          getSizedBoxVertical(),
          controllerFabricante.formField,
          controllerFixacaoFerramenta.formField,
          controllerCodSuporteDaBroca.formField,
          controllerCodInsertoBroca.formField,
          controllerAngSuporteDaBroca.formField,
          controllerAngDaBroca.formField,
          controllerClasse.formField,
          controllerQuantidadeArestas.formField,
          controllerDiametroBroca.formField,
          getCheckBox(),
          getSizedBoxVertical(),
          valueRefrigeracao ? ShowUpAnimation(direction: Direction.horizontal, animationDuration: const Duration(milliseconds: 500), delayStart: const Duration(milliseconds: 0), child: controllerPressaoRefrigeracao.formField) : const SizedBox(),
          controllerVelocidadeDeCorte.formField,
          controllerAvancoPorRotacao.formField,
          controllerRendimentoDePecasPorArestas.formField,
          controllerPecasPorAresta.formField,
          _getBotao(title: 'Preencher dados da TROY', function: () => save()),
        ],
      ),
    );
  }

  Widget _getBotao({required String title, void Function()? function}) {
    return Center(
      child: getElevatedButton(
        context,
        function: () => save(),
        texto: title,
        width: MediaQuery.of(context).size.width - 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return getScaffoldDefault(
      title: 'Atual (Comparação)',
      body: _body(),
      bodyColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade300,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
