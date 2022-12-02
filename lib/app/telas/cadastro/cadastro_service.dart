import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/app/endpoints/endpoints.dart';
import 'package:jornada_troy_ferramentas/models/usuario_model.dart';


Future postCadastro(UsuarioModel entrarModel) {
  return http.post(
    Uri.parse(apiUsuarioPost()),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(entrarModel.toMap()),
  );
}
