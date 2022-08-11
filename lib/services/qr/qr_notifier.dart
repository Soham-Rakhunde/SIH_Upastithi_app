import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sih_student_app/common_widgets/alert_dialog.dart';
import 'package:sih_student_app/services/providers.dart';
import 'package:sih_student_app/services/qr/qrModel.dart';

class QrNotifier extends StateNotifier<QrModel> {
  QrNotifier(QrModel state) : super(state);

  bool scanned = false;

  // init(){
  //   state.controller = MobileScannerController(torchEnabled: false);
  // }

  scanQr(
      BuildContext context, WidgetRef ref,
      {isScanned = false, required VoidCallback navigateToDash}) {
    scanned = isScanned;
    return MobileScanner(
        // controller: state.controller,
      allowDuplicates: false,
        onDetect: ((qr, args) async {
          print('QRCODE ${qr.rawValue}');
          if (!scanned) {
            try {
              final jsonData = base64ToJson(qr.rawValue!);
              scanned = true;
              state = QrModel.fromRawJson(jsonData);
              await markAttendance(context, ref);
              navigateToDash.call();
              // await state.controller.stop();
              // await state.controller.start();
              // cameraDispose();
            }on Exception catch(error){
              scanned= false;
            }
          }
        }));
  }

  markAttendance(BuildContext context, WidgetRef ref) async {
    final studentId = ref.watch(userController.notifier).state.studentId;

    alertDialog(context,
        asset: 'assets/lottie/qr_loading.json', autoDispose: false);
    var url =
        Uri.https("upastithiapi.herokuapp.com", "markStudentQRAttendance");
    var response = await http.post(url, body: {
      "tempOTP": state.tempOtp,
      "tempCode": state.tempCode,
      "studentID": studentId
    });
    Navigator.pop(context);
    if (response.statusCode == 200) {
      state = QrModel.fromRawJson(response.body);
      alertDialog(context,
          msg: "Attendance Marked",
          asset: 'assets/lottie/qr_complete.json',
          autoDispose: false);
    } else {
      Map<String, dynamic> responseJson = json.decode(response.body);
      alertDialog(context,
          msg: responseJson['message'],
          asset: 'assets/lottie/empty.json',
          autoDispose: false);
    }
  }

  String base64ToJson(String qrValue) => utf8.decode(base64.decode(qrValue));

  // @override
  // void dispose() {
  //   super.dispose();
  //   // cameraDispose();
  //   print("disposeddd");
  // }

  // cameraDispose() => state.controller.dispose();
}
