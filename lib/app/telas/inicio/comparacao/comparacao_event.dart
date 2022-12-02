import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/empresa_model.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';

abstract class ComparacaoEvent {}

class ComparacaoSalvarEvent extends ComparacaoEvent {
  HistoricoModel model;

  ComparacaoSalvarEvent({required this.model});
}

class EmpresasLoadEvent extends ComparacaoEvent {
  EmpresasLoadEvent();
}

class EmpresasSaveEvent extends ComparacaoEvent {
  EmpresaModel empresasModel;

  EmpresasSaveEvent(this.empresasModel);
}
