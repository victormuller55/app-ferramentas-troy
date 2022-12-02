import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/calculos/calculos.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_event.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_state.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/resultados_page/resultados_page.dart';
import 'package:jornada_troy_ferramentas/form_fields/text_form_field_double.dart';
import 'package:jornada_troy_ferramentas/form_fields/text_form_field_int.dart';
import 'package:jornada_troy_ferramentas/form_fields/text_form_field_text.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:jornada_troy_ferramentas/widgets/buttons.dart';
import 'package:jornada_troy_ferramentas/widgets/container.dart';
import 'package:jornada_troy_ferramentas/widgets/navigator.dart';
import 'package:jornada_troy_ferramentas/widgets/notification.dart';
import 'package:jornada_troy_ferramentas/widgets/scaffold.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../../../app_theme/app_theme.dart';

class ComparacaoTroy extends StatefulWidget {
  final HistoricoModel contaModel;

  const ComparacaoTroy({Key? key, required this.contaModel}) : super(key: key);

  @override
  State<ComparacaoTroy> createState() => _ComparacaoTroyState();
}

class _ComparacaoTroyState extends State<ComparacaoTroy> {
  ComparacaoBloc bloc = ComparacaoBloc();

  bool valueRefrigeracao = false;

  // campos
  TextFormFieldText controllerFabricante = TextFormFieldText('Ferramentas Troy', hintText: 'Fabricante');
  TextFormFieldText controllerFixacaoFerramenta = TextFormFieldText('', hintText: 'Fixação da ferramenta');
  TextFormFieldInt controllerCodSuporteDaBroca = TextFormFieldInt('', hintText: 'Código de suporte da broca');
  DoubleFormField controllerAngSuporteDaBroca = DoubleFormField(0, hintText: 'Ângulo de suporte da broca', symbol: '(º)');
  DoubleFormField controllerAngDaBroca = DoubleFormField(0, hintText: 'Ângulo da broca', symbol: '(º)');
  TextFormFieldInt controllerCodInsertoBroca = TextFormFieldInt('', hintText: 'Código de inserto da broca');
  TextFormFieldText controllerClasse = TextFormFieldText('', hintText: 'Classe');
  TextFormFieldInt controllerQuantidadeArestas = TextFormFieldInt('', hintText: 'Quantidade de Arestas', haveInputFormatters: true);
  DoubleFormField controllerDiametroBroca = DoubleFormField(0, hintText: 'Diãmetro da broca', symbol: '(mm)');
  DoubleFormField controllerPressaoRefrigeracao = DoubleFormField(0, hintText: 'Pressão de refrigeração', symbol: '(bars)');
  DoubleFormField controllerVelocidadeDeCorte = DoubleFormField(0, hintText: 'Velocidade de corte', symbol: '(m/mm)');
  DoubleFormField controllerAvancoPorRotacao = DoubleFormField(0, hintText: 'Avanço por rotação', symbol: '(mm/rot)');
  TextFormFieldText controllerRendimentoDePecasPorArestas = TextFormFieldText('', hintText: 'Rendimento de peças por aresta');
  TextFormFieldInt controllerPecasPorAresta = TextFormFieldInt('', hintText: 'Peças por aresta');

  // resultados

  void save() {
    double calculoRotacao = calculoRotacaoDoEixoPrincipal(velocidadeDeCorte: double.parse(widget.contaModel.velocidadeDeCorte!), diametro: double.parse(widget.contaModel.diametroDaBroca!));
    double calculoAvanco = calculoAvancoLinear(velocidadeDeCorte: double.parse(widget.contaModel.velocidadeDeCorte!), diametro: double.parse(widget.contaModel.diametroDaBroca!), avancoPorRotacao: controllerAvancoPorRotacao.unformattedValue);
    double calculoAtivoTempo = calculoAtivoTempoDeCorte(comprimentoDeFuro: double.parse(widget.contaModel.comprimentoDoFuro!), numeroDeFuros: double.parse(widget.contaModel.numeroDeFuros!), calculoAvancoLinear: calculoAvanco);
    double calculoAtivoTempoAresta = calculoAtivoTempoDeCortePorAresta(pecasPorAresta: double.parse(widget.contaModel.pecasPorAresta!), tempoAtivoDeCorte: calculoAtivoTempo);
    double calculoVidaUtilAresta = calculoVidaUtilDaAresta(pecasPorAresta: double.parse(widget.contaModel.pecasPorAresta!), comprimentoDoFuro: double.parse(widget.contaModel.comprimentoDoFuro!), numeroDeFuros: double.parse(widget.contaModel.numeroDeFuros!));

    double calculoRotacaoTroy = calculoRotacaoDoEixoPrincipal(velocidadeDeCorte: controllerVelocidadeDeCorte.unformattedValue, diametro: controllerDiametroBroca.unformattedValue);
    double calculoAvancoTroy = calculoAvancoLinear(velocidadeDeCorte: controllerVelocidadeDeCorte.unformattedValue, diametro: controllerDiametroBroca.unformattedValue, avancoPorRotacao: controllerAvancoPorRotacao.unformattedValue);
    double calculoAtivoTempoTroy = calculoAtivoTempoDeCorte(comprimentoDeFuro: double.parse(widget.contaModel.comprimentoDoFuro!), numeroDeFuros: double.parse(widget.contaModel.numeroDeFuros!), calculoAvancoLinear: calculoAvancoTroy);
    double calculoAtivoTempoArestaTroy = calculoAtivoTempoDeCortePorAresta(pecasPorAresta: double.parse(controllerPecasPorAresta.unformattedValue), tempoAtivoDeCorte: calculoAtivoTempoTroy);
    double calculoVidaUtilArestaTroy = calculoVidaUtilDaAresta(pecasPorAresta: double.parse(controllerPecasPorAresta.unformattedValue), comprimentoDoFuro: double.parse(widget.contaModel.comprimentoDoFuro!), numeroDeFuros: double.parse(widget.contaModel.numeroDeFuros!));

    double calculoGanhoRendimentoTroy = calculoGanhoDeRendimento(pecasPorArestaTroy: double.parse(controllerPecasPorAresta.unformattedValue), pecasPorArestaConcorrente: double.parse(widget.contaModel.pecasPorAresta!));
    double calculoGanhoTempoUsinagem = calculoGanhoDeTempoDeUsinagem(tempoAtivoDeCorteTroy: calculoAtivoTempoTroy, tempoAtivoDeCorteConcorrente: calculoAtivoTempo);

    HistoricoModel contaModel = HistoricoModel(
      nomeEmpresa: widget.contaModel.nomeEmpresa,
      cnpj: widget.contaModel.cnpj,
      nomeMaquina: widget.contaModel.nomeMaquina,
      numeroMaquina: widget.contaModel.numeroMaquina,
      material: widget.contaModel.material,
      aisi: widget.contaModel.aisi,
      comprimentoDoFuro: widget.contaModel.comprimentoDoFuro,
      numeroDeFuros: widget.contaModel.numeroDeFuros,
      fabricante: widget.contaModel.fabricante,
      fixacaoFerramenta: widget.contaModel.fixacaoFerramenta,
      codigoSuporteDaBroca: widget.contaModel.codigoSuporteDaBroca,
      anguloSuporteDaBroca: widget.contaModel.anguloSuporteDaBroca,
      anguloDaBroca: widget.contaModel.anguloDaBroca,
      codigoInsertoBroca: widget.contaModel.codigoInsertoBroca,
      classe: widget.contaModel.classe,
      quantidadeDeArestas: widget.contaModel.quantidadeDeArestas,
      diametroDaBroca: widget.contaModel.diametroDaBroca,
      refrigeracao: widget.contaModel.refrigeracao,
      pressaoDeRefrigeracao: widget.contaModel.pressaoDeRefrigeracao,
      velocidadeDeCorte: widget.contaModel.velocidadeDeCorte,
      avancoPorRotacao: widget.contaModel.avancoPorRotacao,
      rendimentoDePecasPorArestas: widget.contaModel.rendimentoDePecasPorArestas,
      pecasPorAresta: widget.contaModel.pecasPorAresta,
      fabricanteTroy: controllerFabricante.unformattedValue,
      fixacaoFerramentaTroy: controllerFixacaoFerramenta.unformattedValue,
      codigoSuporteDaBrocaTroy: controllerCodSuporteDaBroca.unformattedValue,
      anguloSuporteDaBrocaTroy: controllerAngSuporteDaBroca.unformattedValue.toString(),
      anguloDaBrocaTroy: controllerAngDaBroca.unformattedValue.toString(),
      codigoInsertoBrocaTroy: controllerCodInsertoBroca.unformattedValue,
      classeTroy: controllerClasse.unformattedValue,
      quantidadeDeArestasTroy: controllerQuantidadeArestas.unformattedValue,
      diametroDaBrocaTroy: controllerDiametroBroca.unformattedValue.toString(),
      refrigeracaoTroy: valueRefrigeracao ? 'SIM' : 'NAO',
      pressaoDeRefrigeracaoTroy: controllerPressaoRefrigeracao.unformattedValue.toString(),
      velocidadeDeCorteTroy: controllerVelocidadeDeCorte.unformattedValue.toString(),
      avancoPorRotacaoTroy: controllerAvancoPorRotacao.unformattedValue.toString(),
      rendimentoDePecasPorArestasTroy: controllerRendimentoDePecasPorArestas.unformattedValue,
      pecasPorArestaTroy: controllerPecasPorAresta.unformattedValue,
      calculoRotacao: calculoRotacao.toString(),
      calculoRotacaoTroy: calculoRotacaoTroy.toString(),
      calculoAvancoLinear: calculoAvanco.toString(),
      calculoAvancoLinearTroy: calculoAvancoTroy.toString(),
      calculoTempoAtivoDeCorte: calculoAvanco.toString(),
      calculoTempoAtivoDeCorteTroy: calculoAvancoTroy.toString(),
      calculoTempoAtivoDeCortePorAresta: calculoAtivoTempoAresta.toString(),
      calculoTempoAtivoDeCortePorArestaTroy: calculoAtivoTempoArestaTroy.toString(),
      calculoVidaUtilDaAresta: calculoVidaUtilAresta.toString(),
      calculoVidaUtilDaArestaTroy: calculoVidaUtilArestaTroy.toString(),
      calculoGanhoDeRendimento: calculoGanhoRendimentoTroy.toString(),
      calculoTempoDeUsinagem: calculoGanhoTempoUsinagem.toString(),
      dataHora: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} - ${DateTime.now().hour}:${DateTime.now().minute}',
    );

    bloc.add(ComparacaoSalvarEvent(model: contaModel));

    open(
        context,
        ResultadosPage(
          historicoModel: contaModel,
          isComparacao: true,
        ));
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
              child: text('Agora preencha os dados da FERRAMENTAS TROY.', textAlign: TextAlign.center, color: Colors.white),
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
          _getBotao(title: 'Finalizar', function: () => save()),
        ],
      ),
    );
  }

  Widget _getBotao({required String title, void Function()? function}) {
    return Center(
      child: getElevatedButton(context, function: function, texto: title, width: MediaQuery.of(context).size.width - 16),
    );
  }

  _blocBuilder() {
    return BlocConsumer(
      bloc: bloc,
      listener: (context, state) {
        if (state is ComparacaoSuccessState) {
          getAvisoPopup(context, mensagem: 'Salvo com sucesso');
        }
        if (state is ComparacaoErrorState) {
          getAvisoPopup(context, mensagem: 'Desculpe, algo deu errado.', icon: Icons.close, color: Colors.red);
        }
      },
      builder: (context, state) {
        if (state is ComparacaoLoadingState) {
          getLoadingWithoutPopup(context);
        }
        return _body();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return getScaffoldDefault(
      title: 'TROY (Comparação)',
      body: _blocBuilder(),
      bodyColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade300,
    );
  }
}
