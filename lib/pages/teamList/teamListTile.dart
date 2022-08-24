import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/scholarshipDetails.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/scholarships/scholarship_model.dart';
import 'package:sih_student_app/services/subject_wise/subjectModel.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TeamListTile extends ConsumerWidget {
  TeamListTile({Key? key,required this.model, required this.color}) : super(key: key);
  Color color;
  TeamModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final diameter = 20 * size.height / 45 - 30;
    final pieWidth = size.width / 8;
    double height = size.height * 0.11;
    double percent = (model.total == 0 )? 100:100*(model.present??1) /(model.total??1);

    List<Color> statusColor;
    if(percent>=90)
      statusColor = [Colors.greenAccent,Colors.green];
    else if(percent>=80)
      statusColor = [Colors.lightGreenAccent,Colors.lightGreen];
    else if(percent>=75)
      statusColor = [Colors.yellowAccent,Colors.yellow];
    else if(percent>=50)
      statusColor =[Colors.orangeAccent,Colors.orange];
    else if(percent>0)
      statusColor =[Colors.deepOrangeAccent.shade100,Colors.deepOrange];
    else
      statusColor = [Colors.redAccent,Colors.red];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.008),
      child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        closedElevation: 0,
        transitionType: ContainerTransitionType.fadeThrough,
        closedColor: Colors.white,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        openBuilder: (context, closedContainer) {
          return Container();
        },
        closedBuilder: (context, openContainer) {
          return Container(
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
                    decoration: BoxDecoration (
                      // color: statusColor[0],
                      gradient: LinearGradient(colors: statusColor.reversed.toList()),
                      borderRadius: BorderRadius.circular(size.width * 0.06),
                    ),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 50,
                        child: Center(
                          child: ListTile(
                            dense: true,
                            visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                            title: Text(
                              model.teamName??"Subject",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width / 23),
                            ),
                            subtitle: Text(
                              "${model.present??0} / ${model.total??0}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width / 26),
                            ),
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                Expanded(
                    flex:8,
                    child: FittedBox(
                      child: SleekCircularSlider(
                        min: 0,
                        max: 100,
                        initialValue: percent,
                        appearance: CircularSliderAppearance(
                          animationEnabled: true,
                          animDurationMultiplier: 2,
                          size: lerpDouble(0, diameter, 0.865)!,
                          startAngle: 270,
                          angleRange: 360,
                          infoProperties: InfoProperties(
                            mainLabelStyle: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 60,
                                color: Colors.black54),
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
                            progressBarColors: statusColor.reversed.toList(),
                            dotColor: Colors.transparent,
                            hideShadow: true,
                            gradientStartAngle: 183,
                            gradientEndAngle: 355,
                            shadowStep: 20,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
