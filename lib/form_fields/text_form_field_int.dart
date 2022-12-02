import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'text_form_field_componentes.dart';
import 'text_form_field_generic.dart';

class TextFormFieldInt extends GenericFormField {
  TextFormFieldInt(
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
    bool? isCNPJ,
    bool? haveInputFormatters,
  }) {
    controller = TextEditingController(text: value);
    var maskFormatter = MaskTextInputFormatter(mask: '##.###.###/####-##', type: MaskAutoCompletionType.eager);

    formField = getTextFormField(
      controller ?? TextEditingController(text: value),
      decoration: decoration,
      showBorder: showBorder,
      labelText: labelText,
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      keyboardType: TextInputType.number,
      textInputAction: textInputAction,
      fontSize: fontSize,
      maxLength: maxLength,
      autoFocus: autoFocus,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: haveInputFormatters ?? false ? [CurrencyTextInputFormatter(decimalDigits: 0, locale: 'pt-br', symbol: simbolo ?? '')] : isCNPJ ?? false ? [maskFormatter] : []
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
