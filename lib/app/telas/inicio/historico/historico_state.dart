import 'package:jornada_troy_ferramentas/models/historico_model.dart';

abstract class HistoricoState {
  List<HistoricoModel> contaModel;

  HistoricoState({
    required this.contaModel,
  });
}

class HistoricoInitialState extends HistoricoState {
  HistoricoInitialState() : super(contaModel: []);
}

class HistoricoLoadingState extends HistoricoInitialState {}

class HistoricoSuccessState extends HistoricoState {
  HistoricoSuccessState({required List<HistoricoModel> contaModel}) : super(contaModel: contaModel);
}

class HistoricoErrorState extends HistoricoInitialState {}
