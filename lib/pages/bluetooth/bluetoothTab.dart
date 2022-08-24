import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_student_app/services/colors.dart';

class BluetoothTab extends ConsumerWidget {
  const BluetoothTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: bluetoothColor,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Lottie.asset('assets/lottie/ripple.json'),
          ),
          Positioned(
          // height: size.width*0.4,
            bottom: size.height*0.85,
            width: size.width*0.8,
            height:
            size.height * 0.1, // Set this height
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,),
                height: double.infinity,
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Bluetooth Attendance",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: textColor),
                  ),
                )),
          ),
          Positioned(
            // height: size.width*0.4,
            width: size.width*0.1,
            child: FittedBox(
              child: FaIcon(
                FontAwesomeIcons.bluetoothB,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}