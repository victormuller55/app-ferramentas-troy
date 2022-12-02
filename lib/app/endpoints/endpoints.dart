const String server = 'http://172.16.1.111:8080';

String apiUsuarioPost() => "$server/api/troy/usuario/cadastrar"; // POST
String apiUsuarioGet({required String email, required String senha}) => '$server/api/troy/usuario/login?email=$email&senha=$senha'; // GET
String apiUsuarioDelete({required int idUsuario}) => '$server/api/troy/usuario/delete/$idUsuario'; // DELETE
String apiComparacaoPost({required String idUsuario}) => '$server/api/troy/produto/cadastrar?id_usuario=$idUsuario'; // POST
String apiComparacaoGet({required String idUsuario}) => '$server/api/troy/comparacao?id_usuario=$idUsuario'; // GET
String apiEmpresaPost() => '$server/api/troy/empresa/cadastrar'; // POST
String apiEmpresaGet() => '$server/api/troy/empresa/todos'; // GET
String apiDashboardGet() => '$server/api/troy/dashboard'; // GET
