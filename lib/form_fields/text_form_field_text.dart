import 'package:flutter/material.dart';

import 'text_form_field_componentes.dart';
import 'text_form_field_generic.dart';

class TextFormFieldText extends GenericFormField {
  TextFormFieldText(
    String value, {
    InputDecoration? decoration,
    bool? showBorder,
    String? labelText,
    String? hintText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    TextInputAction? textInputAction,
    double? fontSize,
    int? maxLength,
    bool? autoFocus,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    bool? divisorPadrao,
    String? simbolo,
  }) {
    controller = TextEditingController(text: value);

    formField = getTextFormField(
      controller ?? TextEditingController(text: value),
      decoration: decoration,
      showBorder: showBorder,
      labelText: labelText,
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      fontSize: fontSize,
      maxLength: maxLength,
      autoFocus: autoFocus,
      onChanged: onChanged,
      validator: validator,
    );
  }

  @override
  void updateValue(dynamic value) {
    controller?.text = value;
  }

  @override
  String get unformattedValue => controller?.value.text ?? '';

  @override
  String get formattedValue => controller?.value.text ?? '';
}
