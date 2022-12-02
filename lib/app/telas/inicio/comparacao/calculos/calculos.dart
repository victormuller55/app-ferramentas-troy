double calculoRotacaoDoEixoPrincipal({required double velocidadeDeCorte, required double diametro}) { //
  double velocidade = (velocidadeDeCorte * 1000) / (3.14 * diametro);
  return velocidade;
}

double calculoAvancoLinear({required double velocidadeDeCorte, required double diametro, required avancoPorRotacao}) {  // todo Velocidade de avanço do eixo principal
  double avanco = calculoRotacaoDoEixoPrincipal(velocidadeDeCorte: velocidadeDeCorte, diametro: diametro) * avancoPorRotacao;
  return avanco;
}

double calculoAtivoTempoDeCorte({required double comprimentoDeFuro, required double numeroDeFuros, required double calculoAvancoLinear}) {
  double tempo = (comprimentoDeFuro * numeroDeFuros) / calculoAvancoLinear;
  return tempo;
}

double calculoAtivoTempoDeCortePorAresta({required double pecasPorAresta, required double tempoAtivoDeCorte}) {
  double porAresta = pecasPorAresta * tempoAtivoDeCorte;
  return porAresta;
}

double calculoVidaUtilDaAresta({required double pecasPorAresta,required double numeroDeFuros, required double comprimentoDoFuro}) {
  double vidaUtil = (pecasPorAresta * numeroDeFuros * comprimentoDoFuro) / 1000;
  return vidaUtil;
}

double calculoGanhoDeRendimento({required double pecasPorArestaTroy,required double pecasPorArestaConcorrente}) {
  double ganhoDeRendimento = (pecasPorArestaTroy / pecasPorArestaConcorrente) - 1;
  return ganhoDeRendimento;
}

double calculoGanhoDeTempoDeUsinagem({required double tempoAtivoDeCorteTroy,required double tempoAtivoDeCorteConcorrente}) {
  double tempo = 1 - (tempoAtivoDeCorteTroy / tempoAtivoDeCorteConcorrente);
  return tempo;
}