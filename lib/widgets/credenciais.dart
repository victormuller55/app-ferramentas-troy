import 'package:jornada_troy_ferramentas/models/usuario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UsuarioModel> getCrendeciais() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  UsuarioModel model = UsuarioModel(
    id: preferences.getInt('id'),
    nome: preferences.getString('nome'),
    email: preferences.getString('email'),
    senha: preferences.getString('senha'),
    username: preferences.getString('username'),
  );

  return model;
}
