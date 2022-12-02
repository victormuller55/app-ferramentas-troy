import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_page/comparacao_empresa.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:jornada_troy_ferramentas/widgets/navigator.dart';
import 'package:jornada_troy_ferramentas/widgets/notification.dart';
import 'package:jornada_troy_ferramentas/widgets/scaffold.dart';
import 'package:jornada_troy_ferramentas/widgets/screenshot.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:screenshot/screenshot.dart';

class ResultadosPage extends StatefulWidget {
  final HistoricoModel historicoModel;
  final bool isComparacao;

  const ResultadosPage({Key? key, required this.historicoModel, required this.isComparacao}) : super(key: key);

  @override
  State<ResultadosPage> createState() => _ResultadosPageState();
}

class _ResultadosPageState extends State<ResultadosPage> {
  final CurrencyTextInputFormatter _formatter2Digitos = CurrencyTextInputFormatter(decimalDigits: 2, enableNegative: true, symbol: '', locale: 'pt-br');
  final CurrencyTextInputFormatter _formatter1digito = CurrencyTextInputFormatter(enableNegative: true, symbol: '', locale: 'pt-br');

  final ScreenshotController controller = ScreenshotController();

  Widget _value(String value, {bool? bold}) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: text(value, bold: bold ?? false, color: Colors.grey.shade700),
      ),
    );
  }

  TableRow table2(String title, String? value) {
    return TableRow(children: [_value(title, bold: true), _value(value!)]);
  }

  TableRow table3(String title, String? value1, String? value2) {
    return TableRow(children: [_value(title, bold: true), _value(value1!), _value(value2!)]);
  }

  Widget _body() {
    String? nomeEmpresa = widget.historicoModel.nomeEmpresa;
    String? cnpj = widget.historicoModel.cnpj;
    String? nomeMaquina = widget.historicoModel.nomeMaquina;
    String? numeroMaquina = widget.historicoModel.numeroMaquina;
    String? material = widget.historicoModel.material;
    String? aisi = widget.historicoModel.aisi;
    String? comprimentoDoFuro = '${_formatter2Digitos.format(widget.historicoModel.comprimentoDoFuro ?? '')} mm';
    String? numeroDeFuros = widget.historicoModel.numeroDeFuros ?? '';

    String? fabricante = widget.historicoModel.fabricante ?? '';
    String? fixacaoFerramenta = widget.historicoModel.fixacaoFerramenta ?? '';
    String? codigoSuporteDaBroca = widget.historicoModel.codigoSuporteDaBroca ?? '';
    String? anguloSuporteDaBroca = '${widget.historicoModel.anguloSuporteDaBroca ?? ''}º';
    String? anguloDaBroca = '${widget.historicoModel.anguloDaBroca ?? ''}º';
    String? codigoInsertoBroca = widget.historicoModel.codigoInsertoBroca ?? '';
    String? classe = widget.historicoModel.classe ?? '';
    String? quantidadeDeArestas = widget.historicoModel.quantidadeDeArestas ?? '';
    String? diametroDaBroca = '${_formatter2Digitos.format(widget.historicoModel.diametroDaBroca ?? '')} mm';
    String? refrigeracao = widget.historicoModel.refrigeracao ?? '';
    String? pressaoDeRefrigeracao = '${_formatter2Digitos.format(widget.historicoModel.pressaoDeRefrigeracao ?? '')} bars';
    String? velocidadeDeCorte = "${_formatter2Digitos.format(widget.historicoModel.velocidadeDeCorte ?? '')} m/min";
    String? avancoPorRotacao = "${_formatter2Digitos.format(widget.historicoModel.avancoPorRotacao ?? '')} mm/rot";
    String? rendimentoDePecasPorArestas = widget.historicoModel.rendimentoDePecasPorArestas ?? '';
    String? pecasPorAresta = '${widget.historicoModel.pecasPorAresta ?? 'NULL'} peças';

    String? fabricanteTroy = widget.historicoModel.fabricanteTroy ?? '';
    String? fixacaoFerramentaTroy = widget.historicoModel.fixacaoFerramenta ?? '';
    String? codigoSuporteDaBrocaTroy = widget.historicoModel.codigoSuporteDaBrocaTroy ?? '';
    String? anguloSuporteDaBrocaTroy = '${widget.historicoModel.anguloDaBrocaTroy ?? ''}º';
    String? anguloDaBrocaTroy = '${widget.historicoModel.anguloDaBrocaTroy ?? ''}º';
    String? codigoInsertoBrocaTroy = widget.historicoModel.codigoInsertoBrocaTroy ?? '';
    String? classeTroy = widget.historicoModel.classeTroy ?? '';
    String? quantidadeDeArestasTroy = widget.historicoModel.quantidadeDeArestasTroy ?? '';
    String? diametroDaBrocaTroy = '${_formatter2Digitos.format(widget.historicoModel.diametroDaBrocaTroy ?? '')} mm';
    String? refrigeracaoTroy = widget.historicoModel.refrigeracaoTroy ?? '';
    String? pressaoDeRefrigeracaoTroy = '${_formatter2Digitos.format(widget.historicoModel.pressaoDeRefrigeracaoTroy ?? '')} bars';
    String? velocidadeDeCorteTroy = "${_formatter2Digitos.format(widget.historicoModel.velocidadeDeCorteTroy ?? '')} m/min";
    String? avancoPorRotacaoTroy = "${_formatter2Digitos.format(widget.historicoModel.avancoPorRotacaoTroy ?? '')} mm/rot";
    String? rendimentoDePecasPorArestasTroy = widget.historicoModel.rendimentoDePecasPorArestasTroy ?? '';
    String? pecasPorArestaTroy = '${widget.historicoModel.pecasPorArestaTroy ?? 'NULL'} peças';

    String? calculoRotacao = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoRotacao ?? '').toStringAsFixed(2))} RPM';
    String? calculoAvancoLinear = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoAvancoLinear ?? '').toStringAsFixed(2))} mm/min';
    String? calculoTempoAtivoDeCorte = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoTempoAtivoDeCorte ?? '').toStringAsFixed(2))} min';
    String? calculoTempoAtivoDeCortePorAresta = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoTempoAtivoDeCortePorAresta ?? '').toStringAsFixed(2))} min';
    String? calculoVidaUtilDaAresta = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoVidaUtilDaAresta ?? '').toStringAsFixed(2))} mts lineares';

    String? calculoRotacaoTroy = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoRotacaoTroy ?? '').toStringAsFixed(2))} RPM';
    String? calculoAvancoLinearTroy = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoAvancoLinearTroy ?? '').toStringAsFixed(2))} mm/min';
    String? calculoTempoAtivoDeCorteTroy = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoTempoAtivoDeCorteTroy ?? '').toStringAsFixed(2))} min';
    String? calculoTempoAtivoDeCortePorArestaTroy = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoTempoAtivoDeCortePorArestaTroy ?? '').toStringAsFixed(2))} min';
    String? calculoVidaUtilDaArestaTroy = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoVidaUtilDaArestaTroy ?? '').toStringAsFixed(2))} mts lineares';

    String? calculoGanhoDeRendimento = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoGanhoDeRendimento ?? '').toStringAsFixed(2))} %';
    String? calculoTempoDeUsinagem = '${_formatter1digito.format(double.parse(widget.historicoModel.calculoTempoDeUsinagem ?? '').toStringAsFixed(2))} min';

    return captureThisWidget(
      controller: controller,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            getSizedBoxVertical(),
            text('Dados da comparação', bold: true, fontSize: 20),
            getSizedBoxVertical(),
            Table(
              border: TableBorder.all(width: 0.5, borderRadius: BorderRadius.circular(10)),
              children: [
                table2('Nome da empresa', nomeEmpresa),
                table2('CNPJ da Empresa', cnpj),
                table2('Data e Hora', widget.historicoModel.dataHora),
                table2('Nome da maquina', nomeMaquina),
                table2('Número da maquina', numeroMaquina),
                table2('Material', material),
                table2('AISI', aisi),
                table2('Comprimento do furo', comprimentoDoFuro),
                table2('Número de furos', numeroDeFuros),
              ],
            ),
            getSizedBoxVertical(),
            text('Dados das brocas', bold: true, fontSize: 20),
            getSizedBoxVertical(),
            Table(
              border: TableBorder.all(width: 0.5, borderRadius: BorderRadius.circular(10)),
              children: [
                table3('Valores', 'Ferramentas TROY', 'Concorrentes'),
                table3('Fabricante', fabricanteTroy, fabricante),
                table3('Fixação da ferramenta', fixacaoFerramentaTroy, fixacaoFerramenta),
                table3('Código de suporte da broca', codigoSuporteDaBrocaTroy, codigoSuporteDaBroca),
                table3('Angulo de suporte da broca', anguloSuporteDaBrocaTroy, anguloSuporteDaBroca),
                table3('Angulo da broca', anguloDaBrocaTroy, anguloDaBroca),
                table3('Código do inserto / Broca', codigoInsertoBrocaTroy, codigoInsertoBroca),
                table3('Classe', classeTroy, classe),
                table3('Quantidade de arestas', quantidadeDeArestasTroy, quantidadeDeArestas),
                table3('Diametro da broca', diametroDaBrocaTroy, diametroDaBroca),
                table3('Refrigeração', refrigeracaoTroy, refrigeracao),
                table3('Pressão da Refrigeração', pressaoDeRefrigeracaoTroy, pressaoDeRefrigeracao),
                table3('Velocidade de corte', velocidadeDeCorteTroy, velocidadeDeCorte),
                table3('Avanço por rotação', avancoPorRotacaoTroy, avancoPorRotacao),
                table3('Rendimento por peças por arestas', rendimentoDePecasPorArestasTroy, rendimentoDePecasPorArestas),
                table3('Peças por arestas', pecasPorArestaTroy, pecasPorAresta),
              ],
            ),
            getSizedBoxVertical(),
            text('Resultados', bold: true, fontSize: 20),
            getSizedBoxVertical(),
            Table(
              border: TableBorder.all(width: 0.5, borderRadius: BorderRadius.circular(10)),
              children: [
                table3('Valores', 'Ferramentas TROY', 'Concorrentes'),
                table3('Calculo da rotação do eixo principal', calculoRotacaoTroy, calculoRotacao),
                table3('Calculo de avanço linear', calculoAvancoLinearTroy, calculoAvancoLinear),
                table3('Calculo de tempo ativo de corte', calculoTempoAtivoDeCorteTroy, calculoTempoAtivoDeCorte),
                table3('Calculo de tempo ativo de corte por aresta', calculoTempoAtivoDeCortePorArestaTroy, calculoTempoAtivoDeCortePorAresta),
                table3('Calculo de vida util da aresta', calculoVidaUtilDaArestaTroy, calculoVidaUtilDaAresta),
                table3('Calculo de ganho de rendimento', calculoGanhoDeRendimento, ''),
                table3('Calculo de ganho de tempo de usinagem', calculoTempoDeUsinagem, ''),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getScaffoldDefault(
      leading: widget.isComparacao ? IconButton(onPressed: () => openSemVolta(context, const ComparacaoEmpresa()), icon: const Icon(Icons.close)) : null,
      title: 'Resultados da Comparação - ${widget.historicoModel.dataHora}',
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('030045'),
        child: const Icon(Icons.download, color: Colors.white),
        onPressed: () {
          try {
            takeScreenshot(context, controller, historicoModel: widget.historicoModel);
            getAvisoPopup(context, mensagem: 'PDF Gerado com sucesso', color: Colors.green, icon: Icons.check_circle_sharp);
          } catch (e) {
            getAvisoPopup(context, mensagem: 'Não foi possivel gerar o PDF.', color: Colors.red, icon: Icons.close);
          }
        },
      ),
      body: _body(),
    );
  }
}
