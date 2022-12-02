import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

import '../apresentacao/apresentacao_page_widget.dart';
import '../entrar/entrar_page.dart';
import 'cadastro_bloc.dart';
import 'cadastro_event.dart';
import 'cadastro_state.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  CadastroBloc cadastroBloc = CadastroBloc();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

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

  void _salvar() {
    List<String> erros = [];

    if (_nomeController.text.isEmpty || _emailController.text.isEmpty || _senhaController.text.isEmpty || _emailController.text.isEmpty) {
      erros.add('Preencha todos os campos.');
    }

    if (!validatorEmail(_emailController.text)) {
      erros.add('Email invalido.');
    }

    if (_senhaController.text != _confirmarSenhaController.text) {
      erros.add('As senhas não são iguais.');
    }

    if (erros.isNotEmpty) {
      getAvisoPopup(context, mensagem: erros.first, color: Colors.orange, icon: Icons.warning);
    } else {
      UsuarioModel cadastroModel = UsuarioModel(
        nome: _nomeController.text,
        email: _emailController.text,
        senha: _senhaController.text,
      );

      cadastroBloc.add(CadastrarEvent(cadastroModel));
    }
  }

  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text('Cadastrar'.toUpperCase(), bold: true, fontSize: 17),
        getSizedBoxVertical(height: 20),
        getTextFormFieldCadastroLogin(context, 'Digite o seu nome', controller: _nomeController),
        getTextFormFieldCadastroLogin(context, 'Digite o seu e-mail', controller: _emailController),
        getTextFormFieldCadastroLogin(context, 'Digite a sua senha', controller: _senhaController, showSenha: showSenha),
        getTextFormFieldCadastroLogin(context, 'Confirmar senha', controller: _confirmarSenhaController, showSenha: showSenha),
        Row(
          children: [
            getSizedBoxHorizontal(width: 15),
            Checkbox(fillColor: MaterialStateProperty.all<Color>(Colors.blue.shade900), value: showSenha, onChanged: (value) => setState(() => showSenha = !showSenha)),
            text('Ver senha', bold: true),
          ],
        ),
        getElevatedButton(context, texto: 'Cadastrar'.toUpperCase(), function: () => _salvar(), width: MediaQuery.of(context).size.width - 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text('Já tenho conta: '),
            TextButton(onPressed: () => openSemVolta(context, const EntrarPage()), child: text('ENTRAR', bold: true)),
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
                height: 450,
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

  _blocBuilder() {
    return BlocConsumer<CadastroBloc, CadastroState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case CadastroLoadingState:
            getLoading(context);
            isLoading = true;
            break;
          case CadastroSuccessState:
            Navigator.of(context, rootNavigator: true).pop();
            _saveCredenciais(state.entrarModel);
            openSemVolta(context, const ApresentacaoPageWidget());
            getAvisoPopup(context, mensagem: 'Cadastro realizado com sucesso');
            break;
          case CadastroErrorState:
            if (isLoading) {
              Navigator.pop(context);
            }
            getAvisoPopup(context, mensagem: 'Erro ao cadastrar', icon: Icons.close, color: Colors.red);
        }
      },
      bloc: cadastroBloc,
      builder: (context, state) {
        return _body();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _blocBuilder());
  }
}
