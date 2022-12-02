import '../../../models/usuario_model.dart';

abstract class CadastroEvent {}

class CadastrarEvent extends CadastroEvent {
  UsuarioModel entrarModel;

  CadastrarEvent(this.entrarModel);
}
