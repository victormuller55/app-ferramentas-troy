import 'package:flutter/material.dart';

Future openSemVolta(BuildContext context, Widget page) {
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}

Future open(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
