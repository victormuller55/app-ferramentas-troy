import '../../../models/usuario_model.dart';

abstract class EntrarState {
  UsuarioModel entrarModel;

  EntrarState({
    required this.entrarModel,
  });
}

class EntrarInitialState extends EntrarState {
  EntrarInitialState() : super(entrarModel: UsuarioModel.empty());
}

class EntrarLoadingState extends EntrarInitialState {}

class EntrarSuccessState extends EntrarState {
  EntrarSuccessState({required UsuarioModel entrarModel}) : super(entrarModel: entrarModel);
}

class EntrarErrorState extends EntrarInitialState {}