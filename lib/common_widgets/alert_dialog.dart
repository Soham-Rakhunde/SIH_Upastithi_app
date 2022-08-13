import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_student_app/services/providers.dart';

void alertDialog(BuildContext context,
    {String? msg,
    String? asset,
      Widget? widget,
    required bool autoDispose,
    Duration? duration}) {
  Timer? _timer;

  showDialog(
      barrierColor: Colors.transparent,
      // barrierColor: ismsg ? Colors.white : Colors.white.withOpacity(0.85),
      context: context,
      barrierDismissible: msg != null,
      builder: (_) {
        if (duration != null) {
          Timer _timer = Timer(duration, () =>
            Navigator.of(context).pop());
        }
        return  BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: AlertDialog(
            title: msg != null
                ? Text(
                    msg,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                : null,
            content:
            (asset!=null)?Lottie.asset(
              asset,
              repeat: true,
              width: 100,
            )
            :SizedBox(width:100, height:100, child: widget),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
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
