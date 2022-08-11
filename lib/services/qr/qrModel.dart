import 'dart:convert';

import 'package:mobile_scanner/mobile_scanner.dart';

class QrModel {
  QrModel({
    this.tempOtp,
    this.tempCode,
  }) : controller = MobileScannerController(torchEnabled: false);

  final String? tempOtp;
  final String? tempCode;
  MobileScannerController controller;

  QrModel copyWith({
    String? tempOtp,
    String? tempCode,
  }) =>
      QrModel(
        tempOtp: tempOtp ?? this.tempOtp,
        tempCode: tempCode ?? this.tempCode,
      );

  factory QrModel.fromRawJson(String str) => QrModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
        tempOtp: json["tempOTP"],
        tempCode: json["tempCode"],
      );

  Map<String, dynamic> toJson() => {
        "tempOTP": tempOtp,
        "tempCode": tempCode,
      };
}
