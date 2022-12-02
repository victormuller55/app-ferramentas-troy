import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_event.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_service.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/comparacao_state.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/empresa_model.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';

class ComparacaoBloc extends Bloc<ComparacaoEvent, ComparacaoState> {
  ComparacaoBloc() : super(ComparacaoInitialState()) {
    on<ComparacaoSalvarEvent>((event, emit) async {
      emit(ComparacaoLoadingState());

      try {
        var response = await postComporacao(event.model);
        var json = jsonDecode(response.body);
        var model = HistoricoModel.fromMap(json);
        emit(ComparacaoSuccessState(model: model));
      } catch (e) {
        emit(ComparacaoErrorState());
      }
    });

    on<EmpresasSaveEvent>((event, emit) async {
      emit(ComparacaoLoadingState());

      try {
        var response = await postEmpresa(event.empresasModel);
        var json = jsonDecode(response.body);
        var model = EmpresaModel.fromJson(json);
        emit(ComparacaoSuccessState(empresaModel: model, model: HistoricoModel.empty()));
      } catch (e) {
        emit(ComparacaoErrorState());
      }
    });

    on<EmpresasLoadEvent>((event, emit) async {
      emit(ComparacaoLoadingState());
      try {
        http.Response response = await getEmpresas();
        var jsonModel = json.decode(response.body) as List;
        List<EmpresaModel> listModel = [];

        for (var element in jsonModel) {
          listModel.add(EmpresaModel.fromJson(element));
        }

        emit(ComparacaoSuccessState(empresaModelList: listModel, model: HistoricoModel.empty()));
      } catch (e) {
        emit(ComparacaoErrorState());
      }
    });
  }
}
