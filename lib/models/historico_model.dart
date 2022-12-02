class HistoricoModel {
  int? idComparacao;
  String? nomeEmpresa;
  String? cnpj;
  String? nomeMaquina;
  String? numeroMaquina;
  String? material;
  String? aisi;
  String? comprimentoDoFuro;
  String? numeroDeFuros;
  String? fabricante;
  String? fixacaoFerramenta;
  String? codigoSuporteDaBroca;
  String? anguloSuporteDaBroca;
  String? anguloDaBroca;
  String? codigoInsertoBroca;
  String? classe;
  String? quantidadeDeArestas;
  String? diametroDaBroca;
  String? refrigeracao;
  String? pressaoDeRefrigeracao;
  String? velocidadeDeCorte;
  String? avancoPorRotacao;
  String? rendimentoDePecasPorArestas;
  String? pecasPorAresta;
  String? fabricanteTroy;
  String? fixacaoFerramentaTroy;
  String? codigoSuporteDaBrocaTroy;
  String? anguloSuporteDaBrocaTroy;
  String? anguloDaBrocaTroy;
  String? codigoInsertoBrocaTroy;
  String? classeTroy;
  String? quantidadeDeArestasTroy;
  String? diametroDaBrocaTroy;
  String? refrigeracaoTroy;
  String? pressaoDeRefrigeracaoTroy;
  String? velocidadeDeCorteTroy;
  String? avancoPorRotacaoTroy;
  String? rendimentoDePecasPorArestasTroy;
  String? pecasPorArestaTroy;
  String? dataHora;

  String? calculoRotacao;
  String? calculoAvancoLinear;
  String? calculoTempoAtivoDeCorte;
  String? calculoTempoAtivoDeCortePorAresta;
  String? calculoVidaUtilDaAresta;

  String? calculoRotacaoTroy;
  String? calculoAvancoLinearTroy;
  String? calculoTempoAtivoDeCorteTroy;
  String? calculoTempoAtivoDeCortePorArestaTroy;
  String? calculoVidaUtilDaArestaTroy;

  String? calculoGanhoDeRendimento;
  String? calculoTempoDeUsinagem;

  HistoricoModel({
    this.idComparacao,
    this.nomeEmpresa,
    this.cnpj,
    this.nomeMaquina,
    this.numeroMaquina,
    this.material,
    this.aisi,
    this.comprimentoDoFuro,
    this.numeroDeFuros,
    this.fabricante,
    this.fixacaoFerramenta,
    this.codigoSuporteDaBroca,
    this.anguloSuporteDaBroca,
    this.anguloDaBroca,
    this.codigoInsertoBroca,
    this.classe,
    this.quantidadeDeArestas,
    this.diametroDaBroca,
    this.refrigeracao,
    this.pressaoDeRefrigeracao,
    this.velocidadeDeCorte,
    this.avancoPorRotacao,
    this.rendimentoDePecasPorArestas,
    this.pecasPorAresta,
    this.fabricanteTroy,
    this.fixacaoFerramentaTroy,
    this.codigoSuporteDaBrocaTroy,
    this.anguloSuporteDaBrocaTroy,
    this.anguloDaBrocaTroy,
    this.codigoInsertoBrocaTroy,
    this.classeTroy,
    this.quantidadeDeArestasTroy,
    this.diametroDaBrocaTroy,
    this.refrigeracaoTroy,
    this.pressaoDeRefrigeracaoTroy,
    this.velocidadeDeCorteTroy,
    this.avancoPorRotacaoTroy,
    this.rendimentoDePecasPorArestasTroy,
    this.pecasPorArestaTroy,
    this.dataHora,
    this.calculoRotacao,
    this.calculoAvancoLinear,
    this.calculoTempoAtivoDeCorte,
    this.calculoTempoAtivoDeCortePorAresta,
    this.calculoVidaUtilDaAresta,
    this.calculoRotacaoTroy,
    this.calculoAvancoLinearTroy,
    this.calculoTempoAtivoDeCorteTroy,
    this.calculoTempoAtivoDeCortePorArestaTroy,
    this.calculoVidaUtilDaArestaTroy,
    this.calculoGanhoDeRendimento,
    this.calculoTempoDeUsinagem,
  });

  factory HistoricoModel.empty() {
    return HistoricoModel(
      idComparacao: 0,
      nomeEmpresa: "",
      cnpj: "",
      nomeMaquina: "",
      numeroMaquina: "",
      material: "",
      aisi: "",
      comprimentoDoFuro: "",
      numeroDeFuros: "",
      fabricante: "",
      fixacaoFerramenta: "",
      codigoSuporteDaBroca: "",
      anguloSuporteDaBroca: "",
      anguloDaBroca: "",
      codigoInsertoBroca: "",
      classe: "",
      quantidadeDeArestas: "",
      diametroDaBroca: "",
      refrigeracao: "",
      pressaoDeRefrigeracao: "",
      velocidadeDeCorte: "",
      avancoPorRotacao: "",
      rendimentoDePecasPorArestas: "",
      pecasPorAresta: "",
      fabricanteTroy: "",
      fixacaoFerramentaTroy: "",
      codigoSuporteDaBrocaTroy: "",
      anguloSuporteDaBrocaTroy: "",
      anguloDaBrocaTroy: "",
      codigoInsertoBrocaTroy: "",
      classeTroy: "",
      quantidadeDeArestasTroy: "",
      diametroDaBrocaTroy: "",
      refrigeracaoTroy: "",
      pressaoDeRefrigeracaoTroy: "",
      velocidadeDeCorteTroy: "",
      avancoPorRotacaoTroy: "",
      rendimentoDePecasPorArestasTroy: "",
      pecasPorArestaTroy: "",
      dataHora: "",
      calculoRotacao: "",
      calculoAvancoLinear: "",
      calculoTempoAtivoDeCorte: "",
      calculoTempoAtivoDeCortePorAresta: "",
      calculoVidaUtilDaAresta: "",
      calculoRotacaoTroy: "",
      calculoAvancoLinearTroy: "",
      calculoTempoAtivoDeCorteTroy: "",
      calculoTempoAtivoDeCortePorArestaTroy: "",
      calculoVidaUtilDaArestaTroy: "",
      calculoGanhoDeRendimento: "",
      calculoTempoDeUsinagem: "",
    );
  }

  HistoricoModel.fromMap(Map<String, dynamic> json) {
    idComparacao = json['idComparacao'];
    nomeEmpresa = json['nomeEmpresa'];
    cnpj = json['cnpj'];
    nomeMaquina = json['nomeMaquina'];
    numeroMaquina = json['numeroMaquina'];
    material = json['material'];
    aisi = json['aisi'];
    comprimentoDoFuro = json['comprimentoDoFuro'];
    numeroDeFuros = json['numeroDeFuros'];
    fabricante = json['fabricante'];
    fixacaoFerramenta = json['fixacaoFerramenta'];
    codigoSuporteDaBroca = json['codigoSuporteDaBroca'];
    anguloSuporteDaBroca = json['anguloSuporteDaBroca'];
    anguloDaBroca = json['anguloDaBroca'];
    codigoInsertoBroca = json['codigoInsertoBroca'];
    classe = json['classe'];
    quantidadeDeArestas = json['quantidadeDeArestas'];
    diametroDaBroca = json['diametroDaBroca'];
    refrigeracao = json['refrigeracao'];
    pressaoDeRefrigeracao = json['pressaoDeRefrigeracao'];
    velocidadeDeCorte = json['velocidadeDeCorte'];
    avancoPorRotacao = json['avancoPorRotacao'];
    rendimentoDePecasPorArestas = json['rendimentoDePecasPorArestas'];
    pecasPorAresta = json['pecasPorAresta'];
    fabricanteTroy = json['fabricanteTroy'];
    fixacaoFerramentaTroy = json['fixacaoFerramentaTroy'];
    codigoSuporteDaBrocaTroy = json['codigoSuporteDaBrocaTroy'];
    anguloSuporteDaBrocaTroy = json['anguloSuporteDaBrocaTroy'];
    anguloDaBrocaTroy = json['anguloDaBrocaTroy'];
    codigoInsertoBrocaTroy = json['codigoInsertoBrocaTroy'];
    classeTroy = json['classeTroy'];
    quantidadeDeArestasTroy = json['quantidadeDeArestasTroy'];
    diametroDaBrocaTroy = json['diametroDaBrocaTroy'];
    refrigeracaoTroy = json['refrigeracaoTroy'];
    pressaoDeRefrigeracaoTroy = json['pressaoDeRefrigeracaoTroy'];
    velocidadeDeCorteTroy = json['velocidadeDeCorteTroy'];
    avancoPorRotacaoTroy = json['avancoPorRotacaoTroy'];
    rendimentoDePecasPorArestasTroy = json['rendimentoDePecasPorArestasTroy'];
    pecasPorArestaTroy = json['pecasPorArestaTroy'];
    dataHora = json['dataHora'];
    calculoRotacao = json['calculoRotacao'];
    calculoAvancoLinear = json['calculoAvancoLinear'];
    calculoTempoAtivoDeCorte = json['calculoTempoAtivoDeCorte'];
    calculoTempoAtivoDeCortePorAresta = json['calculoTempoAtivoDeCortePorAresta'];
    calculoVidaUtilDaAresta = json['calculoVidaUtilDaAresta'];
    calculoRotacaoTroy = json['calculoRotacaoTroy'];
    calculoAvancoLinearTroy = json['calculoAvancoLinearTroy'];
    calculoTempoAtivoDeCorteTroy = json['calculoTempoAtivoDeCorteTroy'];
    calculoTempoAtivoDeCortePorArestaTroy = json['calculoTempoAtivoDeCortePorArestaTroy'];
    calculoVidaUtilDaArestaTroy = json['calculoVidaUtilDaArestaTroy'];
    calculoGanhoDeRendimento = json['calculoGanhoDeRendimento'];
    calculoTempoDeUsinagem = json['calculoTempoDeUsinagem'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idComparacao'] = idComparacao;
    data['nomeEmpresa'] = nomeEmpresa;
    data['cnpj'] = cnpj;
    data['nomeMaquina'] = nomeMaquina;
    data['numeroMaquina'] = numeroMaquina;
    data['material'] = material;
    data['aisi'] = aisi;
    data['comprimentoDoFuro'] = comprimentoDoFuro;
    data['numeroDeFuros'] = numeroDeFuros;
    data['fabricante'] = fabricante;
    data['fixacaoFerramenta'] = fixacaoFerramenta;
    data['codigoSuporteDaBroca'] = codigoSuporteDaBroca;
    data['anguloSuporteDaBroca'] = anguloSuporteDaBroca;
    data['anguloDaBroca'] = anguloDaBroca;
    data['codigoInsertoBroca'] = codigoInsertoBroca;
    data['classe'] = classe;
    data['quantidadeDeArestas'] = quantidadeDeArestas;
    data['diametroDaBroca'] = diametroDaBroca;
    data['refrigeracao'] = refrigeracao;
    data['pressaoDeRefrigeracao'] = pressaoDeRefrigeracao;
    data['velocidadeDeCorte'] = velocidadeDeCorte;
    data['avancoPorRotacao'] = avancoPorRotacao;
    data['rendimentoDePecasPorArestas'] = rendimentoDePecasPorArestas;
    data['pecasPorAresta'] = pecasPorAresta;
    data['fabricanteTroy'] = fabricanteTroy;
    data['fixacaoFerramentaTroy'] = fixacaoFerramentaTroy;
    data['codigoSuporteDaBrocaTroy'] = codigoSuporteDaBrocaTroy;
    data['anguloSuporteDaBrocaTroy'] = anguloSuporteDaBrocaTroy;
    data['anguloDaBrocaTroy'] = anguloDaBrocaTroy;
    data['codigoInsertoBrocaTroy'] = codigoInsertoBrocaTroy;
    data['classeTroy'] = classeTroy;
    data['quantidadeDeArestasTroy'] = quantidadeDeArestasTroy;
    data['diametroDaBrocaTroy'] = diametroDaBrocaTroy;
    data['refrigeracaoTroy'] = refrigeracaoTroy;
    data['pressaoDeRefrigeracaoTroy'] = pressaoDeRefrigeracaoTroy;
    data['velocidadeDeCorteTroy'] = velocidadeDeCorteTroy;
    data['avancoPorRotacaoTroy'] = avancoPorRotacaoTroy;
    data['rendimentoDePecasPorArestasTroy'] = rendimentoDePecasPorArestasTroy;
    data['pecasPorArestaTroy'] = pecasPorArestaTroy;
    data['dataHora'] = dataHora;
    data['calculoRotacao'] = calculoRotacao;
    data['calculoAvancoLinear'] = calculoAvancoLinear;
    data['calculoTempoAtivoDeCorte'] = calculoTempoAtivoDeCorte;
    data['calculoTempoAtivoDeCortePorAresta'] = calculoTempoAtivoDeCortePorAresta;
    data['calculoVidaUtilDaAresta'] = calculoVidaUtilDaAresta;
    data['calculoRotacaoTroy'] = calculoRotacaoTroy;
    data['calculoAvancoLinearTroy'] = calculoAvancoLinearTroy;
    data['calculoTempoAtivoDeCorteTroy'] = calculoTempoAtivoDeCorteTroy;
    data['calculoTempoAtivoDeCortePorArestaTroy'] = calculoTempoAtivoDeCortePorArestaTroy;
    data['calculoVidaUtilDaArestaTroy'] = calculoVidaUtilDaArestaTroy;
    data['calculoGanhoDeRendimento'] = calculoGanhoDeRendimento;
    data['calculoTempoDeUsinagem'] = calculoTempoDeUsinagem;
    return data;
  }
}
