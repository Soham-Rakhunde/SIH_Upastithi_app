import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/scholarshipDetails.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/scholarships/scholarship_model.dart';

class ScholarshipListTile extends ConsumerWidget {
  ScholarshipListTile({Key? key, required this.model, required this.color}) : super(key: key);
  ScholarshipModel model;
  Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    double height = size.height * 0.1;
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
          return ScholarshipDetail(model: model,);
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
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(size.width * 0.06),
                    ),
                  ),
                ),
                Expanded(
                  flex: 32,
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
                              model.scholarshipName??"Error",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width / 24),
                            ),
                            subtitle: Text(
                              model.scholarshipEndDate.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width / 27),
                            ),
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                Container(
                  width: size.height*0.065,
                  height: size.height*0.08,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(size.width * 0.03),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
