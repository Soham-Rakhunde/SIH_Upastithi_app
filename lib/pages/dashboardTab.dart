import 'dart:math';
import 'dart:ui';
import 'package:flutter_annual_task/flutter_annual_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/common_widgets/roundedContainer.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DashboardTab extends ConsumerWidget {
  const DashboardTab({Key? key}) : super(key: key);

  static List<AnnualTaskItem> generateAnnualTask({int? year, int? sampleSize}) {
    var rnd = Random();
    sampleSize = sampleSize ?? max(80, min(365, rnd.nextInt(200)));
    year ??= DateTime.now().year;
    DateTime prevDate = DateTime(year, 1, 1);
    return List.generate(sampleSize, (idx) {
      int maxDiff =
          (365 - prevDate.difference(DateTime(year!, 12, 31)).inDays) ~/
              (sampleSize! - idx);
      prevDate = prevDate.add(Duration(days: rnd.nextInt(maxDiff) + 1));
      return AnnualTaskItem(prevDate, rnd.nextDouble());
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final diameter = 20 * size.height / 46 - 30;
    final pieWidth = size.width / 12;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      padding: EdgeInsets.all(size.width * 0.08),
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Text(
                  "Dashboard",
                  style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 10,
            child: RoundedContainer(
              size: size,
              child: Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: 50,
                  appearance: CircularSliderAppearance(
                    animationEnabled: true,
                    animDurationMultiplier: 0.1,
                    size: lerpDouble(0, diameter, 0.865)!,
                    startAngle: 180,
                    angleRange: 180,
                    infoProperties: InfoProperties(
                      bottomLabelText: "Attendance",
                      mainLabelStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 45,
                          color: Colors.black54),
                      bottomLabelStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.black54),
                    ),
                    customWidths: CustomSliderWidths(
                      trackWidth: pieWidth / 7,
                      progressBarWidth: pieWidth,
                      shadowWidth: pieWidth * 1.8,
                    ),
                    customColors: CustomSliderColors(
                      trackColor: Colors.orange.withOpacity(0.5),
                      progressBarColors: redGradient,
                      dotColor: Colors.transparent,
                      shadowColor: Colors.orange.withOpacity(0.1),
                      gradientStartAngle: 183,
                      gradientEndAngle: 355,
                      shadowStep: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 12,
            child: RoundedContainer(
              size: size,
              child: Transform.scale(
                scale: 2.5,
                origin: Offset.zero,
                child: AnnualTaskView(
                  generateAnnualTask(), // List<AnnualTaskItem>
                  cellShape: AnnualTaskCellShape.CIRCLE,
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 7,
          )
        ],
      ),
    );
  }
}
