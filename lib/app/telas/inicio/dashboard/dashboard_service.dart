import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/app/endpoints/endpoints.dart';

Future<http.Response> getDashboard() async {
  http.Response get = await http.get(
    Uri.parse(apiDashboardGet()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return get;
}