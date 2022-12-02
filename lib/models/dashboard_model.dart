class DashboardModel {
  int? idComparacao;
  String? nomeEmpresa;
  String? cnpj;
  String? calculoGanhoDeRendimento;
  String? calculoTempoDeUsinagem;

  DashboardModel({
    this.idComparacao,
    this.nomeEmpresa,
    this.cnpj,
    this.calculoGanhoDeRendimento,
    this.calculoTempoDeUsinagem,
  });

  factory DashboardModel.empty() {
    return DashboardModel(
      idComparacao: 0,
      nomeEmpresa: "",
      cnpj: "",
      calculoGanhoDeRendimento: "",
      calculoTempoDeUsinagem: "",
    );
  }

  DashboardModel.fromMap(Map<String, dynamic> json) {
    idComparacao = json['idComparacao'];
    nomeEmpresa = json['nomeEmpresa'];
    cnpj = json['cnpj'];
    calculoGanhoDeRendimento = json['calculoGanhoDeRendimento'];
    calculoTempoDeUsinagem = json['calculoTempoDeUsinagem'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idComparacao'] = idComparacao;
    data['nomeEmpresa'] = nomeEmpresa;
    data['cnpj'] = cnpj;
    data['calculoGanhoDeRendimento'] = calculoGanhoDeRendimento;
    data['calculoTempoDeUsinagem'] = calculoTempoDeUsinagem;
    return data;
  }
}
