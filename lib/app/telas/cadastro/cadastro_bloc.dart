import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/cadastro/cadastro_service.dart';
import 'package:jornada_troy_ferramentas/models/usuario_model.dart';

import 'cadastro_event.dart';
import 'cadastro_state.dart';

class CadastroBloc extends Bloc<CadastroEvent, CadastroState> {
  CadastroBloc() : super(CadastroInitialState()) {
    on<CadastrarEvent>((event, emit) async {
      emit(CadastroLoadingState());
      try {
        var response = await postCadastro(event.entrarModel);
        var json = jsonDecode(response.body);
        var model = UsuarioModel.fromMap(json);
        emit(CadastroSuccessState(entrarModel: model));
      } catch (e) {
        emit(CadastroErrorState());
      }
    });
  }
}
