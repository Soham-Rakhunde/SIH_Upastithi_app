import 'dart:math';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter_annual_task/flutter_annual_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih_student_app/common_widgets/roundedContainer.dart';
import 'package:sih_student_app/pages/history/historyPage.dart';
import 'package:sih_student_app/pages/teamList/teamListPage.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:sih_student_app/services/providers.dart';
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
    final diameter = 20 * size.height / 40 - 30;
    final pieWidth = size.width / 6;
    final double space = size.height * 0.02;
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          stops: [0.87, 0.87],
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, profileColor],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.srcOver,
      child: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Container(
            width: size.width,
            color: dashColor,
            padding: EdgeInsets.all(size.width * 0.06),
            child: Column(
              children: [
                SizedBox(
                  height: space,
                ),
                SizedBox(
                  height: size.height * 0.09,
                  child: FittedBox(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: const Text(
                        "Upastithi",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: textColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                RoundedContainer(
                  height: size.height * 0.22,
                  size: size,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: FittedBox(
                            child: Text(
                              "Total\nAttendance",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                      Spacer(),
                      Expanded(
                        flex: 8,
                        child: FittedBox(
                          child: SleekCircularSlider(
                            min: 0,
                            max: 100,
                            initialValue: 70,
                            appearance: CircularSliderAppearance(
                              animationEnabled: true,
                              animDurationMultiplier: 0.1,
                              size: lerpDouble(0, diameter, 0.865)!,
                              startAngle: 270,
                              angleRange: 360,
                              infoProperties: InfoProperties(
                                mainLabelStyle: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 55,
                                    color: Colors.black38),
                                bottomLabelStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black54),
                              ),
                              customWidths: CustomSliderWidths(
                                trackWidth: pieWidth,
                                progressBarWidth: pieWidth,
                                shadowWidth: pieWidth * 1.8,
                              ),
                              customColors: CustomSliderColors(
                                trackColor: dashColor,
                                progressBarColors: [Colors.lightBlueAccent, Colors.blue],
                                hideShadow: true,
                                dotColor: Colors.transparent,
                                shadowColor: Colors.orange.withOpacity(0.1),
                                gradientStartAngle: 0,
                                gradientEndAngle: 180,
                                shadowStep: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                SizedBox(
                  height: size.width * 0.33,
                  child: Row(
                    children: [
                      buildDashBoxes(size, space, "History",
                          FontAwesomeIcons.clockRotateLeft, HistoryPage()),
                      SizedBox(
                        width: space,
                      ),
                      buildDashBoxes(size, space, "Subjects",
                          FontAwesomeIcons.chartPie, TeamListPage()),
                    ],
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                Container(
                  width:double.infinity,
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(size.width * 0.08),
                    // boxShadow: boxShadow),
                  ),
                  child: Wrap(
                    children: [
                      HeatMap(
                        datasets: ref.watch(userController.notifier).getHeatMapData(),
                        colorMode: ColorMode.opacity,
                        showText: false,
                        scrollable: true,
                        colorsets: {
                          1: Colors.blue,
                        },
                        onClick: (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(value.toString())));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.5*space,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDashBoxes(
      Size size, double space, String name, IconData icon, Widget onTapOpen) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 1000),
      closedElevation: 0,
      transitionType: ContainerTransitionType.fadeThrough,
      closedColor: Colors.white,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      openBuilder: (context, closedContainer) {
        return onTapOpen;
      },
      closedBuilder: (context, openContainer) {
        return RoundedContainer(
          size: size,
          width: size.width * 0.44 - space / 2,
          height: size.width * 0.44 - space / 2,
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: FaIcon(icon, color: Colors.black38),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black38),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
