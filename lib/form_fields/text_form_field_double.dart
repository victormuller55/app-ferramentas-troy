import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import 'text_form_field_componentes.dart';
import 'text_form_field_generic.dart';

class DoubleFormField extends GenericFormField {
  DoubleFormField(
      double value, {
        int? decimalDigits,
        String? symbol,
        InputDecoration? decoration,
        bool? showBorder,
        String? labelText,
        String? hintText,
        Widget? suffixIcon,
        Widget? prefixIcon,
        TextInputAction? textInputAction,
        double? fontSize,
        bool? autoFocus,
        bool? readOnly,
        void Function(String)? onChanged,
        String? Function(String?)? validator,
        TextAlign? textAlign,
        int? maxLength,
      }) {
    formatter = CurrencyTextInputFormatter(decimalDigits: decimalDigits ?? 2, locale: 'pt-br', symbol: symbol ?? '');
    controller = TextEditingController(text: formatter.format(value.toStringAsFixed(decimalDigits ?? 2)));

    formField = getTextFormField(
      controller ?? TextEditingController(text: formatter.format(value.toStringAsFixed(decimalDigits ?? 2))),
      decoration: decoration,
      showBorder: showBorder,
      labelText: labelText ?? 'Digite o valor',
      hintText: hintText ?? 'Digite um valor',
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      keyboardType: TextInputType.number,
      textInputAction: textInputAction,
      fontSize: fontSize,
      textAlign: textAlign ?? TextAlign.right,
      autoFocus: autoFocus,
      readOnly: readOnly,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: [formatter],
      enableInteractiveSelection: false,
      maxLength: maxLength,
    );
  }

  @override
  void updateValue(dynamic value) {
    controller?.text = formatter.format(value.toDouble().toStringAsFixed(formatter.decimalDigits));
  }

  @override
  double get unformattedValue => formatter.getUnformattedValue().toDouble();

  @override
  String get formattedValue => formatter.getFormattedValue();
}