import 'package:flutter/material.dart';

Widget getErroTentarNovamente({required void Function() function}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, color: Colors.red),
        const SizedBox(height: 10),
        const Text('Erro inesperado', style: TextStyle(fontFamily: 'source', fontWeight: FontWeight.bold, color: Colors.red)),
        const SizedBox(height: 10),
        TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900.withOpacity(0.2)),),onPressed: function, child:  Text('Tentar Novamente', style: TextStyle(color: Colors.blue.shade900)))
      ],
    ),
  );
}