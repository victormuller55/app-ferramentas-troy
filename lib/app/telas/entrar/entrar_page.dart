import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/cadastro/cadastro_page.dart';
import 'package:jornada_troy_ferramentas/models/usuario_model.dart';
import 'package:jornada_troy_ferramentas/validators/validators.dart';
import 'package:jornada_troy_ferramentas/widgets/buttons.dart';
import 'package:jornada_troy_ferramentas/widgets/container.dart';
import 'package:jornada_troy_ferramentas/widgets/forms.dart';
import 'package:jornada_troy_ferramentas/widgets/imagens.dart';
import 'package:jornada_troy_ferramentas/widgets/navigator.dart';
import 'package:jornada_troy_ferramentas/widgets/notification.dart';
import 'package:jornada_troy_ferramentas/widgets/pop_up.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../inicio/inicio/inicio_page.dart';
import 'entrar_bloc.dart';
import 'entrar_event.dart';
import 'entrar_state.dart';

class EntrarPage extends StatefulWidget {
  const EntrarPage({Key? key}) : super(key: key);

  @override
  State<EntrarPage> createState() => _EntrarPageState();
}

class _EntrarPageState extends State<EntrarPage> {

  final EntrarBloc _entrarBloc = EntrarBloc();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool showSenha = false;
  bool isLoading = false;

  void _saveCredenciais(UsuarioModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt('id', model.id!);
    preferences.setString('nome', model.nome!);
    preferences.setString('username', model.username!);
    preferences.setString('email', model.email!);
    preferences.setString('senha', model.senha!);
  }

  void _salvar() async {
    bool podeSalvar = true;

    if (_emailController.text.isEmpty || _senhaController.text.isEmpty) {
      podeSalvar = false;
    }

    if (!validatorEmail(_emailController.text)) {
      podeSalvar = false;
    }

    if (!podeSalvar) {
      getAvisoPopup(context, mensagem: 'Verifique os valores informados.', color: Colors.orange, icon: Icons.warning);
    } else {
      UsuarioModel model = UsuarioModel(email: _emailController.text, senha: _senhaController.text);
      _entrarBloc.add(LoginEvent(entrarModel: model));
    }
  }

  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text('Entrar'.toUpperCase(), bold: true, fontSize: 17),
        getSizedBoxVertical(height: 20),
        getTextFormFieldCadastroLogin(context, 'Digite o seu e-mail', controller: _emailController),
        getTextFormFieldCadastroLogin(context, 'Digite a sua senha', controller: _senhaController, showSenha: showSenha),
        Row(
          children: [
            getSizedBoxHorizontal(width: 15),
            Checkbox(fillColor: MaterialStateProperty.all<Color>(Colors.blue.shade900), value: showSenha, onChanged: (value) => setState(() => showSenha = !showSenha)),
            text('Ver senha', bold: true),
          ],
        ),
        getSizedBoxVertical(height: 5),
        getElevatedButton(context, texto: 'Entrar'.toUpperCase(), function: () => _salvar(), width: MediaQuery.of(context).size.width- 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text('Não tenho conta: '),
            TextButton(onPressed: () => openSemVolta(context, const CadastroPage()), child: text('CADASTRAR', bold: true)),
          ],
        )
      ],
    );
  }

  Widget _front() {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getImagemLogo(paddingTop: 100),
              getContainerDefault(
                height: 350,
                color: Colors.white,
                radius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                child: _form(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Stack(
      children: [
        getFundo(context),
        _front(),
      ],
    );
  }

  Widget _blocBuilder() {
    return BlocConsumer<EntrarBloc, EntrarState>(
      listener: (context, state) async {
        if (state is EntrarLoadingState) {
          getLoading(context);
          isLoading = true;
        }
        if (state is EntrarSuccessState) {
          _saveCredenciais(state.entrarModel);
          if (isLoading) {
            Navigator.pop(context);
          }
          getAvisoPopup(context, mensagem: 'Login realizado com sucesso');
          openSemVolta(context, const InicioPage());
        }
        if (state is EntrarErrorState) {
          if (isLoading) {
            Navigator.pop(context);
          }
          getAvisoPopup(context, mensagem: 'Desculpe, tente novamente.', icon: Icons.close, color: Colors.red);
        }
      },
      bloc: _entrarBloc,
      builder: (context, state) {
        return _body();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _blocBuilder(),
    );
  }
}
