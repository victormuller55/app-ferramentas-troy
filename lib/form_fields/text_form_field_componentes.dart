import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../app/app_theme/app_theme.dart';

getTextFormField(
  TextEditingController controller, {
  double? padding,
  InputDecoration? decoration,
  bool? showBorder,
  String? labelText,
  String? hintText,
  Widget? suffixIcon,
  Widget? prefixIcon,
  bool? isDense,
  EdgeInsetsGeometry? contentPadding,
  bool? filled,
  Color? fillColor,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  bool? autoFocus,
  bool? readOnly,
  bool? obscureText,
  bool? autocorrect,
  int? maxLines,
  int? minLines,
  int? maxLength,
  void Function(String)? onChanged,
  Function? onTap,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatters,
  bool? enableInteractiveSelection,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);




      return Padding(
        padding: EdgeInsets.only(bottom: padding ?? 8),
        child: TextFormField(
          controller: controller,
          decoration: decoration ??
              InputDecoration(
                filled: true,
                fillColor: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white, width: 0)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white, width: 0)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: themeProvider.isDarkMode ? Colors.grey.shade800 : Colors.white, width: 0)),
                hintText: hintText,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                hintStyle: const TextStyle(fontFamily: 'source', fontSize: 15, color: Colors.grey),
              ),
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction ?? TextInputAction.next,
          style: TextStyle(
            color: color,
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.normal
          ),
          textAlign: textAlign ?? TextAlign.left,
          autofocus: autoFocus ?? false,
          readOnly: readOnly ?? false,
          obscureText: obscureText ?? false,
          autocorrect: autocorrect ?? false,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          maxLength: maxLength,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: inputFormatters ?? [],
          enableInteractiveSelection: enableInteractiveSelection ?? true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      );
    },
  );
}
