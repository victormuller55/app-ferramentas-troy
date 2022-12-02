import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/app/endpoints/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<http.Response> getHistorico() async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  int? idUsuario = sharedPreferences.getInt('id');

  http.Response get = await http.get(
    Uri.parse(apiComparacaoGet(idUsuario: idUsuario.toString())),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return get;
}