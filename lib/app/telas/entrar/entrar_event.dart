import 'package:jornada_troy_ferramentas/models/usuario_model.dart';

abstract class EntrarEvent {}

class LoginEvent extends EntrarEvent {
  UsuarioModel entrarModel;
  LoginEvent({required this.entrarModel});
}

class ExcluirContaEvent extends EntrarEvent {
  UsuarioModel entrarModel;
  ExcluirContaEvent({required this.entrarModel});
}
