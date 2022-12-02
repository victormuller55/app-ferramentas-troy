import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';

Future getAvisoPopup(
  BuildContext context, {
  required String mensagem,
  IconData? icon,
  Color? color,
}) {
  return Future.delayed(const Duration(milliseconds: 500)).then(
    (value) => InAppNotification.show(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: color ?? Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Icon(icon ?? Icons.check_circle, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                mensagem,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
      context: context,
    ),
  );
}
