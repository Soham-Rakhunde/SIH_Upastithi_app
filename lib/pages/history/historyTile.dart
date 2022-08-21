import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih_student_app/services/Profile/user_model.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HistoryTile extends ConsumerWidget {
  HistoryTile({Key? key,required this.record, required this.color}) : super(key: key);
  Color color;
  Color okColor = Colors.green, badColor = Colors.red;
  AttendanceRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final diameter = 20 * size.height / 45 - 30;
    final pieWidth = size.width / 7;
    double height = size.height * 0.092;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.008),
      child: Container(
        width: size.width,
        height: height,
        padding: EdgeInsets.all(size.width * 0.04),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(size.width * 0.06),
          // boxShadow: boxShadow
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: record.isPresent? okColor : badColor,
                  borderRadius: BorderRadius.circular(size.width * 0.06),
                ),
              ),
            ),
            Spacer(flex: 2,),
            Expanded(
              flex: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subject Name",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width / 24),
                  ),
                   Text(
                    "${record.timestamp.toString()} ${record.timestamp.getTime()}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width / 27),
                  ),
                ],
              ),
            ),
            Expanded(
                flex:7,
                child: FittedBox(
                  child:FaIcon(
                    record.isPresent?FontAwesomeIcons.checkCircle:FontAwesomeIcons.circleXmark,
                    color: record.isPresent? okColor : badColor,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
