import 'package:flutter/material.dart';

abstract class GenericFormField {
  dynamic formatter;
  TextEditingController? controller;
  Widget formField = const SizedBox();

  void updateValue(dynamic value);

  dynamic get unformattedValue;

  String get formattedValue;

  void dispose() {
    controller?.dispose();
  }
}
