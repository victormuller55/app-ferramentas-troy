import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/app/endpoints/endpoints.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/comparacao/empresa_model.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future postComporacao(HistoricoModel model) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  int? idUsuario = sharedPreferences.getInt('id');

  return http.post(
    Uri.parse(apiComparacaoPost(idUsuario: idUsuario.toString())),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    encoding: Encoding.getByName('UTF-8'),
    body: jsonEncode(model.toMap()),
  );
}

Future postEmpresa(EmpresaModel model) async {
  return http.post(
    Uri.parse(apiEmpresaPost()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    encoding: Encoding.getByName('UTF-8'),
    body: jsonEncode(model.toJson()),
  );
}

Future<http.Response> getEmpresas() async {

  http.Response get = await http.get(
    Uri.parse(apiEmpresaGet()),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return get;
}
