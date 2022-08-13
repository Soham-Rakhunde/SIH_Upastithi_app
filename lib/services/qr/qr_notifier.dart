import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sih_student_app/common_widgets/alert_dialog.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';
import 'package:sih_student_app/services/qr/qrModel.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrNotifier extends StateNotifier<QrModel> {
  QrNotifier(QrModel state) : super(state);

  bool scanned = false;

  // init(){
  //   state.controller = MobileScannerController(torchEnabled: false);
  // }

  Widget getQr(
      {required String data,
        required double size,
        Color? backgroundColor,
        Color? foregroundColor,
        ImageProvider? embeddedImage}) {
    return SizedBox(
      width: size,
      height: size,
      child: QrImage(
        data: data,
        size: size,
        // backgroundColor: backgroundColor ?? Colors.transparent,
        // foregroundColor: foregroundColor,
        // embeddedImage: embeddedImage,
      ),
    );
  }

  void qrGenerator(BuildContext context,
      {String? msg,
        required String data,
        Widget? widget,
        required bool autoDispose,
        Duration? duration}) {
    Timer? _timer;
    final size = MediaQuery.of(context).size;
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        barrierDismissible: true,
        builder: (_) {
          if (duration != null) {
            Timer _timer = Timer(duration, () =>
                Navigator.of(context).pop());
          }
          return  BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: AlertDialog(
              // backgroundColor: profileColor,
              title: msg != null
                  ? Text(
                msg,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
                  : null,
              content:SizedBox(
                width: size.width*0.6,
                height: size.width*0.6,
                child: QrImage(
                  data: data,
                  size: 200,
                  gapless: false,
                  // backgroundColor: Colros,
                  eyeStyle: const QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: Colors.black87,
                  ),
                  dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: Colors.black54,
                  ),
                  // size: 320.0,
                  // embeddedImage: snapshot.data,
                  // embeddedImageStyle: QrEmbeddedImageStyle(
                  //   size: Size.square(60),
                  // ),
                  // // backgroundColor: backgroundColor ?? Colors.transparent,
                  // foregroundColor: foregroundColor,
                  // embeddedImage: embeddedImage,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(size.width/12))),
              actions: false
              // msg != null
                  ? <Widget>[
                TextButton(
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]
                  : null,
            ),
          );
        }).then((val) {
      if (_timer!=null && _timer.isActive) {
        _timer.cancel();
      }
    });
  }

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
