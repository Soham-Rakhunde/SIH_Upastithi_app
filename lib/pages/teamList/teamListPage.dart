import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sih_student_app/common_widgets/scholarshipListTile.dart';
import 'package:sih_student_app/pages/teamList/teamListTile.dart';
import 'package:sih_student_app/services/colors.dart';

class TeamListPage extends ConsumerWidget {
  const TeamListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    // final scholarships = ref.watch(scholarshipController.notifier).getScholarships(context, ref);
    // AsyncValue<List<ScholarshipModel>> list = ref.watch(scholarshipsProvider);
    return Container(
        color: dashColor,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                  delay: const Duration(milliseconds: 400),
                  position: index,
                  child: SlideAnimation(
                      duration: const Duration(seconds: 1),
                      curve: Curves.decelerate,
                      child: FadeInAnimation(
                        child: Column(
                          children: [
                            if (index == 0)
                              SizedBox(
                                height:
                                size.height * 0.1, // Set this height
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.01,
                                        horizontal: size.width * 0.27),
                                    height: double.infinity,
                                    child: const FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Subjects",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: textColor),
                                      ),
                                    )),
                              ),
                            TeamListTile(color: Colors.deepOrange),
                          ],
                        ),
                      )));
            },
          ),
        )
        // list.when(
        //   loading: () => Center(
        //     child: Lottie.asset(
        //       'assets/lottie/loadingLottie.json',
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        //   error: (err, stack) => Center(
        //     child: Lottie.asset(
        //       'assets/lottie/empty.json',
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        //   data: (list) {
        //     return  AnimationLimiter(
        //       child: ListView.builder(
        //         itemCount: list.length,
        //         itemBuilder: (context, index) {
        //           return AnimationConfiguration.staggeredList(
        //               delay: const Duration(milliseconds: 400),
        //               position: index,
        //               child: SlideAnimation(
        //                   duration: const Duration(seconds: 1),
        //                   curve: Curves.decelerate,
        //                   child: FadeInAnimation(
        //                     child: Column(
        //                       children: [
        //                         if (index == 0)
        //                           SizedBox(
        //                             height:
        //                             size.height * 0.13, // Set this height
        //                             child: Container(
        //                                 padding: EdgeInsets.symmetric(
        //                                     vertical: size.height * 0.03,
        //                                     horizontal: size.width * 0.15),
        //                                 height: double.infinity,
        //                                 child: const FittedBox(
        //                                   fit: BoxFit.fitWidth,
        //                                   child: Text(
        //                                     "Scholarships",
        //                                     style: TextStyle(
        //                                         fontWeight: FontWeight.w700,
        //                                         color: textColor),
        //                                   ),
        //                                 )),
        //                           ),
        //                         ScholarshipListTile(model: list[index], color: Colors.red),
        //                       ],
        //                     ),
        //                   )));
        //         },
        //       ),
        //     );
        //   },
        // )
    );
  }
}
