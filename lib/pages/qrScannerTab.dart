import 'package:flutter/material.dart';
import 'package:sih_student_app/services/qrScanPainter.dart';
import 'package:sih_student_app/services/qrService.dart';

class QrScannerTab extends StatefulWidget {
  const QrScannerTab({Key? key}) : super(key: key);

  @override
  State<QrScannerTab> createState() => _QrScannerTabState();
}

class _QrScannerTabState extends State<QrScannerTab> {
  final QrService qrService = QrService();

  onQrFound(String qrValue) {
    qrService.dispose();
    debugPrint(qrValue);
    //Change TAb
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child:  Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: qrService.scanQr(onQrFound),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: QrScanPainter(),
            ),
          ),
        ],
      ),
    );
  }
}
