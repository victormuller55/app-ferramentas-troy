
import 'package:jornada_troy_ferramentas/models/usuario_model.dart';

abstract class CadastroState {
  UsuarioModel entrarModel;

  CadastroState({
    required this.entrarModel,
  });
}

class CadastroInitialState extends CadastroState {
  CadastroInitialState() : super(entrarModel: UsuarioModel.empty());
}

class CadastroLoadingState extends CadastroInitialState {}

class CadastroSuccessState extends CadastroState {
  CadastroSuccessState({required UsuarioModel? entrarModel}) : super(entrarModel: entrarModel!);
}

class CadastroErrorState extends CadastroInitialState {}

