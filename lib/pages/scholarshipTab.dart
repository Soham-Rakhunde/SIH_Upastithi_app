import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_student_app/common_widgets/scholarshipListTile.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';
import 'package:sih_student_app/services/scholarships/scholarship_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sih_student_app/services/scholarships/scholarship_notifier.dart';

class ScholarshipTab extends ConsumerWidget {
  const ScholarshipTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    // final scholarships = ref.watch(scholarshipController.notifier).getScholarships(context, ref);
    AsyncValue<List<ScholarshipModel>> list = ref.watch(scholarshipsProvider);
    return Container(
      color: scholarshipColor,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: list.when(
        loading: () => Center(
          child: Lottie.asset(
            'assets/lottie/loadingLottie.json',
            fit: BoxFit.fill,
          ),
        ),
        error: (err, stack) => Center(
          child: Lottie.asset(
            'assets/lottie/empty.json',
            fit: BoxFit.fill,
          ),
        ),
        data: (list) {
          return  AnimationLimiter(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                    delay: const Duration(milliseconds: 400),
                    position: index,
                    child: SlideAnimation(
                        duration: const Duration(seconds: 1, milliseconds: 500),
                        curve: Curves.decelerate,
                        child: FadeInAnimation(
                          child: Column(
                            children: [
                              if (index == 0)
                                SizedBox(
                                  height:
                                  size.height * 0.13, // Set this height
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 0.03,
                                          horizontal: size.width * 0.15),
                                      height: double.infinity,
                                      child: const FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Scholarships",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: textColor),
                                        ),
                                      )),
                                ),
                              ScholarshipListTile(model: list[index], color: Colors.red),
                            ],
                          ),
                        )));
              },
            ),
          );
        },
      )

      // Column(
      //   children: [
      //     Expanded(
      //       flex: 3,
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
      //         child: FittedBox(
      //           fit: BoxFit.fitWidth,
      //         child: Text(
      //           "Scholarships",
      //           style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
      //         ),
      //     ),
      //       ),),
      //     // Spacer(flex: 1,),
      //     ScholarshipListTile(color: Colors.lightGreen),
      //     ScholarshipListTile(color: Colors.deepPurple),
      //     ScholarshipListTile(color: Colors.deepOrange,),
      //     ScholarshipListTile(color: Colors.yellow,),
      //     ScholarshipListTile(color: Colors.blue,),
      //     ScholarshipListTile(color: Colors.teal,),
      //     Spacer(flex: 2,),
      //     ],
      //   ),
    );
  }
}
