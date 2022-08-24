
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih_student_app/common_widgets/alert_dialog.dart';
import 'package:sih_student_app/common_widgets/centered_large_fab.dart';
import 'package:sih_student_app/common_widgets/profileTiles.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/scholarships/scholarship_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ScholarshipDetail extends ConsumerWidget {
  ScholarshipDetail({Key? key, required this.model}) : super(key: key);

  ScholarshipModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final space = (1 * width) / 30;
    return Scaffold(
      backgroundColor: scholarshipColor,
      floatingActionButton: centeredLargeFAB(
        size: size,
        text: "Register",
        color: Colors.teal,
        textColor: Colors.white,
        func: () async {
          if(model.scholarshipLink==null)
            alertDialog(context,
                msg: "Register Link not Found",
                asset: 'assets/lottie/empty.json',
                autoDispose: false);
          else{
            final url = Uri.parse(model.scholarshipLink!);
            await launchUrl(
              url
            );}
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.all(width*0.06),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: space,
              ),
              Container(
                // margin: EdgeInsets.all(width / 30),
                height: width -  width / 6,
                width: width -  width / 6,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.08),
                  // image: const DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: NetworkImage(
                  //     "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/640px-A_black_image.jpg",
                  //   ),
                  // ),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.teal,
                ),
              ),
              SizedBox(
                height:2* space,
              ),
              Text(
                model.scholarshipName??"Error",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:  width / 13,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: space,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (0.2 * width) / 30, vertical: (width) / 30),
                child: Text(
                  model.scholarshipDescription??"Error",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (1.5 * width) / 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: (1*width)/30,
              ),
              Center(
                child: Text(
                  "Schedule",
                  style: TextStyle(
                    fontFamily: 'MontserratAlternates',
                    fontWeight: FontWeight.bold,
                    fontSize: width / 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: space,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ProfileTile(
                      title: "Start Date",
                      isHalf: true,
                      content: model.scholarshipStartDate.toString(),
                      icon: FontAwesomeIcons.solidCalendarCheck,
                    ),
                  ),
                  SizedBox(
                    width: space,
                  ),
                  Expanded(
                    flex: 5,
                    child: ProfileTile(
                      title: "Last Date",
                      isHalf: true,
                      content: model.scholarshipEndDate.toString(),
                      icon: FontAwesomeIcons.solidCalendarXmark,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (1*width)/30,
              ),
              Center(
                child: Text(
                  "Eligibility",
                  style: TextStyle(
                    fontFamily: 'MontserratAlternates',
                    fontWeight: FontWeight.bold,
                    fontSize: width / 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: space,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ProfileTile(
                      title: "Religion",
                      isHalf: true,
                      content: model.scholarshipEligibility?.religion??"Error",
                      icon: FontAwesomeIcons.personPraying,
                    ),
                  ),
                  SizedBox(
                    width: space,
                  ),
                  Expanded(
                    flex: 6,
                    child: ProfileTile(
                      title: "Attendance",
                      isHalf: true,
                      content: ">${model.scholarshipEligibility?.attendanceAbove}",
                      icon: FontAwesomeIcons.clipboardUser,
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
                    flex: 6,
                    child: ProfileTile(
                      title: "Academics",
                      isHalf: true,
                      content: ">${model.scholarshipEligibility?.academicScoreAbove}%",
                      icon: FontAwesomeIcons.graduationCap,
                    ),
                  ),
                  SizedBox(
                    width: space,
                  ),
                  Expanded(
                    flex: 5,
                    child: ProfileTile(
                      title: "Caste",
                      isHalf: true,
                      content: model.scholarshipEligibility?.caste??"Error",
                      icon: FontAwesomeIcons.solidCopyright,
                    ),
                  ),
                ],
              ),
              SizedBox(height: space*5.5,)
            ],
          ),
        ),
      ),
    );
  }
}
