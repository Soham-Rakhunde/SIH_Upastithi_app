import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';
import 'package:sih_student_app/services/qr/qrScanPainter.dart';

class QrScannerTab extends ConsumerStatefulWidget {
  const QrScannerTab({Key? key}) : super(key: key);

  @override
  ConsumerState<QrScannerTab> createState() => _QrScannerTabState();
}

class _QrScannerTabState extends ConsumerState<QrScannerTab> {
  @override
  Widget build(BuildContext context) {
    final qrService = ref.watch(qrController.notifier);
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: qrService.scanQr(context, ref, navigateToDash: () {
              ref.watch(homeTabController.notifier).state = homeTabs.dashboard;
            }),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: QrScanPainter(),
            ),
          ),
          Positioned(
            left: size.width*0.2,
            width: size.width*0.6,
            top: size.width*0.1,
            child:
            SizedBox(
              height:
              size.height * 0.13, // Set this height
              child: Container(
                  height: double.infinity,

                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Attendance",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )),
            ),),
        ],
      ),
    );
  }
}
