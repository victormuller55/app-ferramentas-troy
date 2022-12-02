import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jornada_troy_ferramentas/models/historico_model.dart';
import 'package:jornada_troy_ferramentas/widgets/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

_share(HistoricoModel historicoModel, Uint8List bytes) async {

  final pdf = pw.Document();
  pagePDF(pdf, historicoModel);

  try {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/comparacao_troy.pdf");
    await file.writeAsBytes(await pdf.save());
    await Share.shareFiles([file.path]);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

captureThisWidget({required ScreenshotController controller, required Widget child}) {
  return Screenshot(
    controller: controller,
    child: child,
  );
}

takeScreenshot(BuildContext context, ScreenshotController screenshotController, {bool? share, bool? showScreenshot, required HistoricoModel historicoModel}) {
  screenshotController.capture(delay: const Duration(milliseconds: 10)).then((capturedImage) async {
    // _saveImage(capturedImage!);
    _share(historicoModel, capturedImage!);
  }).catchError((onError) {});
}
