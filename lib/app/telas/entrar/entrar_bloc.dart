import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/models/usuario_model.dart';
import 'package:jornada_troy_ferramentas/app/telas/entrar/entrar_service.dart';

import 'entrar_event.dart';
import 'entrar_state.dart';

class EntrarBloc extends Bloc<EntrarEvent, EntrarState> {
  EntrarBloc() : super(EntrarInitialState()) {
    on<LoginEvent>((event, emit) async {

      emit(EntrarLoadingState());
      try {
        http.Response response = await getEntrar(entrarModel: event.entrarModel);
        if (response.statusCode == 200) {

          var json = jsonDecode(response.body);
          var model = UsuarioModel.fromMap(json);
          emit(EntrarSuccessState(entrarModel: model));
        } else {
          emit(EntrarErrorState());
        }
      } catch (e) {
        emit(EntrarErrorState());
      }
    });


    on<ExcluirContaEvent>((event, emit) async {
      emit(EntrarLoadingState());
      try {
        http.Response response = await deleteConta(entrarModel: event.entrarModel);
        if (response.statusCode == 200) {
          emit(EntrarSuccessState(entrarModel: UsuarioModel.empty()));
        } else {
          emit(EntrarErrorState());
        }
      } catch (e) {
        emit(EntrarErrorState());
      }
    });
  }
}
