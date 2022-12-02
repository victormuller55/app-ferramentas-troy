class EmpresaModel {
  int? id;
  String? nomeEmpresa;
  String? cnpj;

  EmpresaModel({
    this.id,
    this.nomeEmpresa,
    this.cnpj,
  });

  EmpresaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeEmpresa = json['nomeEmpresa'];
    cnpj = json['cnpj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nomeEmpresa'] = nomeEmpresa;
    data['cnpj'] = cnpj;
    return data;
  }
}
