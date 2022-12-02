import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_event.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_service.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/historico/historico_state.dart';

import '../../../../models/historico_model.dart';

class HistoricoBloc extends Bloc<HistoricoEvent, HistoricoState> {
  HistoricoBloc() : super(HistoricoInitialState()) {
    on<LoadHistoricoEvent>((event, emit) async {
      emit(HistoricoLoadingState());
      try {
        http.Response response = await getHistorico();
        var jsonModel = json.decode(response.body) as List;
        List<HistoricoModel> listModel = [];

        for (var element in jsonModel) {
          listModel.add(HistoricoModel.fromMap(element));
        }

        emit(HistoricoSuccessState(contaModel: listModel));
      } catch (e) {
        emit(HistoricoErrorState());
      }
    });
  }
}
