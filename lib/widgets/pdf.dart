import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

pagePDF(Document pdf, HistoricoModel historicoModel) async {
  final CurrencyTextInputFormatter formatter2Digitos = CurrencyTextInputFormatter(decimalDigits: 2, enableNegative: true, symbol: '', locale: 'pt-br');
  final CurrencyTextInputFormatter formatter1digito = CurrencyTextInputFormatter(enableNegative: true, symbol: '', locale: 'pt-br');

  String? nomeEmpresa = historicoModel.nomeEmpresa;
  String? cnpj = historicoModel.cnpj;
  String? nomeMaquina = historicoModel.nomeMaquina;
  String? numeroMaquina = historicoModel.numeroMaquina;
  String? material = historicoModel.material;
  String? aisi = historicoModel.aisi;
  String? comprimentoDoFuro = '${formatter2Digitos.format(historicoModel.comprimentoDoFuro ?? '')} mm';
  String? numeroDeFuros = historicoModel.numeroDeFuros ?? '';

  String? fabricante = historicoModel.fabricante ?? '';
  String? fixacaoFerramenta = historicoModel.fixacaoFerramenta ?? '';
  String? codigoSuporteDaBroca = historicoModel.codigoSuporteDaBroca ?? '';
  String? anguloSuporteDaBroca = '${historicoModel.anguloSuporteDaBroca ?? ''}º';
  String? anguloDaBroca = '${historicoModel.anguloDaBroca ?? ''}º';
  String? codigoInsertoBroca = historicoModel.codigoInsertoBroca ?? '';
  String? classe = historicoModel.classe ?? '';
  String? quantidadeDeArestas = historicoModel.quantidadeDeArestas ?? '';
  String? diametroDaBroca = '${formatter2Digitos.format(historicoModel.diametroDaBroca ?? '')} mm';
  String? refrigeracao = historicoModel.refrigeracao ?? '';
  String? pressaoDeRefrigeracao = '${formatter2Digitos.format(historicoModel.pressaoDeRefrigeracao ?? '')} bars';
  String? velocidadeDeCorte = "${formatter2Digitos.format(historicoModel.velocidadeDeCorte ?? '')} m/min";
  String? avancoPorRotacao = "${formatter2Digitos.format(historicoModel.avancoPorRotacao ?? '')} mm/rot";
  String? rendimentoDePecasPorArestas = historicoModel.rendimentoDePecasPorArestas ?? '';
  String? pecasPorAresta = '${historicoModel.pecasPorAresta ?? 'NULL'} peças';

  String? fabricanteTroy = historicoModel.fabricanteTroy ?? '';
  String? fixacaoFerramentaTroy = historicoModel.fixacaoFerramenta ?? '';
  String? codigoSuporteDaBrocaTroy = historicoModel.codigoSuporteDaBrocaTroy ?? '';
  String? anguloSuporteDaBrocaTroy = '${historicoModel.anguloDaBrocaTroy ?? ''}º';
  String? anguloDaBrocaTroy = '${historicoModel.anguloDaBrocaTroy ?? ''}º';
  String? codigoInsertoBrocaTroy = historicoModel.codigoInsertoBrocaTroy ?? '';
  String? classeTroy = historicoModel.classeTroy ?? '';
  String? quantidadeDeArestasTroy = historicoModel.quantidadeDeArestasTroy ?? '';
  String? diametroDaBrocaTroy = '${formatter2Digitos.format(historicoModel.diametroDaBrocaTroy ?? '')} mm';
  String? refrigeracaoTroy = historicoModel.refrigeracaoTroy ?? '';
  String? pressaoDeRefrigeracaoTroy = '${formatter2Digitos.format(historicoModel.pressaoDeRefrigeracaoTroy ?? '')} bars';
  String? velocidadeDeCorteTroy = "${formatter2Digitos.format(historicoModel.velocidadeDeCorteTroy ?? '')} m/min";
  String? avancoPorRotacaoTroy = "${formatter2Digitos.format(historicoModel.avancoPorRotacaoTroy ?? '')} mm/rot";
  String? rendimentoDePecasPorArestasTroy = historicoModel.rendimentoDePecasPorArestasTroy ?? '';
  String? pecasPorArestaTroy = '${historicoModel.pecasPorArestaTroy ?? 'NULL'} peças';

  String? calculoRotacao = '${formatter1digito.format(double.parse(historicoModel.calculoRotacao ?? '').toStringAsFixed(2))} RPM';
  String? calculoAvancoLinear = '${formatter1digito.format(double.parse(historicoModel.calculoAvancoLinear ?? '').toStringAsFixed(2))} mm/min';
  String? calculoTempoAtivoDeCorte = '${formatter1digito.format(double.parse(historicoModel.calculoTempoAtivoDeCorte ?? '').toStringAsFixed(2))} min';
  String? calculoTempoAtivoDeCortePorAresta = '${formatter1digito.format(double.parse(historicoModel.calculoTempoAtivoDeCortePorAresta ?? '').toStringAsFixed(2))} min';
  String? calculoVidaUtilDaAresta = '${formatter1digito.format(double.parse(historicoModel.calculoVidaUtilDaAresta ?? '').toStringAsFixed(2))} mts lineares';

  String? calculoRotacaoTroy = '${formatter1digito.format(double.parse(historicoModel.calculoRotacaoTroy ?? '').toStringAsFixed(2))} RPM';
  String? calculoAvancoLinearTroy = '${formatter1digito.format(double.parse(historicoModel.calculoAvancoLinearTroy ?? '').toStringAsFixed(2))} mm/min';
  String? calculoTempoAtivoDeCorteTroy = '${formatter1digito.format(double.parse(historicoModel.calculoTempoAtivoDeCorteTroy ?? '').toStringAsFixed(2))} min';
  String? calculoTempoAtivoDeCortePorArestaTroy = '${formatter1digito.format(double.parse(historicoModel.calculoTempoAtivoDeCortePorArestaTroy ?? '').toStringAsFixed(2))} min';
  String? calculoVidaUtilDaArestaTroy = '${formatter1digito.format(double.parse(historicoModel.calculoVidaUtilDaArestaTroy ?? '').toStringAsFixed(2))} mts lineares';

  String? calculoGanhoDeRendimento = '${formatter1digito.format(double.parse(historicoModel.calculoGanhoDeRendimento ?? '').toStringAsFixed(2))} %';
  String? calculoTempoDeUsinagem = '${formatter1digito.format(double.parse(historicoModel.calculoTempoDeUsinagem ?? '').toStringAsFixed(2))} min';

  pw.Widget caixa(String value, {bool? bold}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(10),
      child: pw.Text(value, style: pw.TextStyle(color: PdfColors.grey, fontWeight: bold == true ? FontWeight.bold : null)),
    );
  }

  pw.TableRow table2(String title, String? value) {
    return pw.TableRow(
      children: [caixa(title, bold: true), caixa(value!)],
    );
  }

  pw.TableRow table3(String title, String? value1, String? value2) {
    return pw.TableRow(
      children: [caixa(title, bold: true), caixa(value1!), caixa(value2!)],
    );
  }

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Column(
            children: [
              pw.Center(child: pw.Text('Dados de Comparação'.toUpperCase(), style: pw.TextStyle(color: PdfColors.black, fontWeight: FontWeight.bold, fontSize: 20))),
              pw.SizedBox(height: 10),
              pw.Text('Dados da comparação'.toUpperCase(), style: const pw.TextStyle(color: PdfColors.grey)),
              pw.SizedBox(height: 10),
              pw.Table(
                border: pw.TableBorder.all(width: 0.5),
                children: [
                  table2('Nome da empresa', nomeEmpresa),
                  table2('CNPJ da Empresa', cnpj),
                  table2('Data e Hora', historicoModel.dataHora),
                  table2('Nome da maquina', nomeMaquina),
                  table2('Número da maquina', numeroMaquina),
                  table2('Material', material),
                  table2('AISI', aisi),
                  table2('Comprimento do furo', comprimentoDoFuro),
                  table2('Número de furos', numeroDeFuros),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Column(
            children: [
              pw.SizedBox(height: 10),
              pw.Text('Dados da broca'.toUpperCase(), style: const pw.TextStyle(color: PdfColors.grey)),
              pw.SizedBox(height: 10),
              pw.Table(
                border: pw.TableBorder.all(width: 0.5),
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
            ],
          ),
        );
      },
    ),
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Column(
            children: [
              pw.SizedBox(height: 10),
              pw.Text('Resultados'.toUpperCase(), style: const pw.TextStyle(color: PdfColors.grey)),
              pw.SizedBox(height: 10),
              pw.Table(
                border: pw.TableBorder.all(width: 0.5),
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
        );
      },
    ),
  );
}
