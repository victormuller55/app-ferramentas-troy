import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/widgets/pop_up.dart';
import 'package:jornada_troy_ferramentas/widgets/sized_box.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';

import 'buttons.dart';
import 'container.dart';

Future<void> showModalExcluirConta(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return getContainerDefault(
        height: 250,
        width: 150,
        padding: 0,
        color: Colors.white,
        radius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  getContainerDefault(height: 6, width: 100, color: Colors.grey.shade400, radius: BorderRadius.circular(10)),
                  getSizedBoxVertical(),
                  text('Excluir conta'.toUpperCase(), bold: true, color: Colors.black, textAlign: TextAlign.center, fontSize: 17),
                  getSizedBoxVertical(),
                  getContainerDefault(
                    padding: 10,
                    radius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                    child: text('Todos os seus dados de usuario e comparações serão apagadas.', textAlign: TextAlign.center, color: Colors.grey.shade700, bold: true),
                  ),
                ],
              ),
              Column(
                children: [
                  getElevatedButton(context, texto: 'SIM', color: Colors.red, width: MediaQuery.of(context).size.width - 16, function: () => sairDaConta(context), textColor: Colors.white),
                  getSizedBoxVertical(),
                  TextButton(onPressed: () => Navigator.pop(context), child: text('Não', bold: true, color: Colors.black)),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showModalSairConta(BuildContext context, {void Function()? function}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return getContainerDefault(
        height: 200,
        width: 150,
        padding: 0,
        color: Colors.white,
        radius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  getContainerDefault(height: 6, width: 100, color: Colors.grey.shade400, radius: BorderRadius.circular(10)),
                  getSizedBoxVertical(),
                  text('Sair da conta ?'.toUpperCase(), bold: true, color: Colors.black, textAlign: TextAlign.center, fontSize: 17),
                ],
              ),
              Column(
                children: [
                  getElevatedButton(context, texto: 'SIM', color: HexColor('030045'), width: MediaQuery.of(context).size.width - 16, function: function ?? () => {}, textColor: Colors.white),
                  getSizedBoxVertical(),
                  TextButton(onPressed: () => Navigator.pop(context), child: text('Não', bold: true, color: Colors.black)),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
