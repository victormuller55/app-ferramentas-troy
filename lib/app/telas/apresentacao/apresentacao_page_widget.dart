import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/inicio/inicio_page.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';

class ApresentacaoPageWidget extends StatefulWidget {
  const ApresentacaoPageWidget({Key? key}) : super(key: key);

  @override
  State<ApresentacaoPageWidget> createState() => _ApresentacaoPageWidgetState();
}

class _ApresentacaoPageWidgetState extends State<ApresentacaoPageWidget> {
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> listaDeTelas = [];

    listaDeTelas.add(
      PageViewModel(
        title: "Bem vindo ao Ferramentas Troy",
        body: "Descubra novas novidades e ferramentas de ótima qualidade",
        image: Image.network("https://storage.googleapis.com/ecdt-logo-saida/cb776bfd744ed26a40b8b34c9f9846d64f2479af309052007ef93983cecf665a/FERRAMENTAS-TROY.webp", height: 220.0),
      ),
    );

    listaDeTelas.add(
      PageViewModel(
        title: "Comparações brocas TROY",
        body: "Faça comparacações com brocas da TROY e a atual, você poderá ver o rendimento.",
        image: Image.network("https://coemjr.com.br/wp-content/uploads/2021/05/Site-Stats-amico-4-1.png", height: 220.0),
      ),
    );

    listaDeTelas.add(
      PageViewModel(
        title: "Dados de comparações",
        body: "Suas comparações são salvas e podem ser vistas a qualquer momento.",
        image: Image.network("https://datavectorsolutions.com/image/imgfour.png", height: 220.0),
      ),
    );

    return Scaffold(
      body: IntroductionScreen(
        pages: listaDeTelas,
        onDone: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InicioPage())),
        onSkip: () {},
        showBackButton: false,
        showSkipButton: true,
        skip: Container(),
        next: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15),
        done: text("Fechar".toUpperCase(), bold: true, fontSize: 15, color: Colors.black),
        dotsDecorator: DotsDecorator(size: const Size.square(10.0), activeSize: const Size(20.0, 10.0), activeColor: HexColor('030045'), color: Colors.black26, spacing: const EdgeInsets.symmetric(horizontal: 3.0), activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
