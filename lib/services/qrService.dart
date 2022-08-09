import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrService {
  MobileScannerController controller =
      MobileScannerController(torchEnabled: false);
  bool scanned = false;

  MobileScanner scanQr(ValueSetter<String> onQrCodeDetect,
      {isScanned = false}) {
    scanned = isScanned;
    return MobileScanner(
        controller: controller,
        onDetect: ((qr, args) {
          print('QRCODE ${qr.rawValue}');
          print("Arguments are:$args");
          if (!scanned) {
            scanned = true;
            return onQrCodeDetect(qr.rawValue!);
          }
        }));
  }

  dispose() {
    controller.dispose();
  }
}
