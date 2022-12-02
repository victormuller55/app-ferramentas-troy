import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/models/usuario_model.dart';

import '../../endpoints/endpoints.dart';

Future<http.Response> getEntrar({required UsuarioModel entrarModel}) async {

  http.Response get = await http.get(
    Uri.parse(apiUsuarioGet(email: entrarModel.email!, senha: entrarModel.senha!)),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return get;
}

Future<http.Response> deleteConta({required UsuarioModel entrarModel}) async {

  http.Response get = await http.delete(
    Uri.parse(apiUsuarioDelete(idUsuario: entrarModel.id!)),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return get;
}
