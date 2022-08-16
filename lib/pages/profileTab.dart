import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih_student_app/common_widgets/roundedContainer.dart';
import 'package:sih_student_app/common_widgets/profileTiles.dart';
import 'package:sih_student_app/services/Profile/user_model.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    UserModel userModel = ref.watch(userController);
    final double space = size.height * 0.02;
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          stops: [0.865, 0.865],
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, profileColor],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.srcOver,
      child: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Container(
            width: size.width,
            color: const Color(0xffECEFF8),
            padding: EdgeInsets.all(size.width * 0.08),
            child: Column(
              children: [

                SizedBox(
                  height: space,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      ref.watch(userController.notifier).logout(context, ref);
                    },
                    child: Container(
                      height: size.width * 0.15,
                      width: size.width * 0.15,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(size.width * 0.01),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(size.width * 0.05),
                        // boxShadow: boxShadow
                      ),
                      child: FittedBox(
                          child: FaIcon(
                        FontAwesomeIcons.rightFromBracket,
                        size: size.width / 15,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.5,
                  height: size.width * 0.5,
                  padding: EdgeInsets.all(size.width * 0.03),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(size.width * 0.08),
                      boxShadow: boxShadow),
                  child: InkWell(
                    onTap: () {
                      ref.watch(qrController.notifier).qrGenerator(context,data:ref.watch(userController).studentId??"Error", autoDispose: true);
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.06),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -size.width * 0.08,
                          right: -size.width * 0.08,
                          width: size.width * 0.17,
                          height: size.width * 0.17,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(size.width * 0.01),
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.05),
                                boxShadow: boxShadow),
                            child: FittedBox(
                                child: FaIcon(
                              FontAwesomeIcons.qrcode,
                              size: size.width / 11,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2 * space,
                ),
                SizedBox(
                    height: size.height * 0.1,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: FittedText(
                          userModel.studentName?.shortName()??"Not Found",
                          weight: FontWeight.w900,
                        ))),
                SizedBox(
                  height: space,
                ),
                ProfileTile(
                  title: "Enrollment ID",
                  content: userModel.studentEnrollmentId ?? "Not Found",
                  icon: FontAwesomeIcons.idBadge,
                ),
                SizedBox(
                  height: space,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: ProfileTile(
                        title: "Roll No.",
                        isHalf: true,
                        content: userModel.studentRollNumber.toString(),
                        icon: FontAwesomeIcons.solidRegistered,
                      ),
                    ),
                    SizedBox(
                      width: space,
                    ),
                    Expanded(
                      flex: 7,
                      child: ProfileTile(
                        title: "Scholarship",
                        isHalf: true,
                        content: (userModel.studentScholarshipEligibile == null)
                            ? "Not Found"
                            : (userModel.studentScholarshipEligibile!
                                ? "Eligible"
                                : "Not Eligible"),
                        icon: FontAwesomeIcons.graduationCap,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: space,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: ProfileTile(
                        title: "Date of Birth",
                        isHalf: true,
                        content: userModel.studentDob.toString(),
                        icon: FontAwesomeIcons.cakeCandles,
                      ),
                    ),
                    SizedBox(
                      width: space,
                    ),
                    Expanded(
                      flex: 5,
                      child: ProfileTile(
                        title: "Gender",
                        isHalf: true,
                        content: userModel.studentGender.toString(),
                        icon: FontAwesomeIcons.personHalfDress,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: space,
                ),
                ProfileTile(
                  height: size.height * 0.15,
                  title: "Address",
                  content: userModel.studentAddress.toString(),
                  icon: FontAwesomeIcons.locationDot,
                ),
                SizedBox(
                  height: space,
                ),
                ProfileTile(
                  title: "Email",
                  content: userModel.studentEmail ?? "Not Found",
                  icon: FontAwesomeIcons.solidEnvelope,
                ),
                SizedBox(
                  height: space,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: ProfileTile(
                        height: size.height*0.11,
                        title: "Phone Number",
                        content: userModel.studentPhoneNumber.toString(),
                        icon: FontAwesomeIcons.phone,
                        isHalf: true,
                      ),
                    ),
                    SizedBox(
                      width: space,
                    ),
                    Expanded(
                      flex: 4,
                      child: ProfileTile(
                        height: size.height*0.11,
                        title: "Blood Group",
                        isHalf: true,
                        content: userModel.studentBloodGroup
                            ?? "Not Found",
                        icon: FontAwesomeIcons.droplet,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 5*space,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
