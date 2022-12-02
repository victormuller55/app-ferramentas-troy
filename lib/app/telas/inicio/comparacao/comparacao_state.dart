import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/empresa_model.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';

abstract class ComparacaoState {
  HistoricoModel model;
  List<EmpresaModel>? empresaModelList;
  EmpresaModel? empresaModel;

  ComparacaoState({
    required this.model,
    this.empresaModelList,
    this.empresaModel,
  });
}

class ComparacaoInitialState extends ComparacaoState {
  ComparacaoInitialState() : super(model: HistoricoModel.empty(), empresaModelList: []);
}

class ComparacaoLoadingState extends ComparacaoInitialState {}

class ComparacaoSuccessState extends ComparacaoState {
  ComparacaoSuccessState({HistoricoModel? model, List<EmpresaModel>? empresaModelList, EmpresaModel? empresaModel}) : super(model: model!, empresaModelList: empresaModelList, empresaModel: empresaModel);
}

class ComparacaoErrorState extends ComparacaoInitialState {}
