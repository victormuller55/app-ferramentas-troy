import 'package:flutter/material.dart';

getTextFormFieldCadastroLogin(
  BuildContext context,
  String text, {
  double? width,
  double? height,
  bool? showSenha,
  TextEditingController? controller,
  Icon? icon,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width - 60,
      child: TextFormField(
        controller: controller,
        obscureText: showSenha != null ? !showSenha : false,
        style: const TextStyle(fontFamily: 'source', fontSize: 15),
        decoration: InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade900)),
          hintText: text,
          hintStyle: const TextStyle(fontFamily: 'source', fontSize: 15),
        ),
      ),
    ),
  );
}
