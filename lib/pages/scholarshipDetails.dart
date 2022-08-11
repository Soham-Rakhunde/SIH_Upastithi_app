
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih_student_app/common_widgets/centered_large_fab.dart';
import 'package:sih_student_app/common_widgets/profileTiles.dart';
import 'package:sih_student_app/services/colors.dart';

class ScholarshipDetail extends ConsumerStatefulWidget {
  const ScholarshipDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<ScholarshipDetail> createState() => _ScholarshipDetailState();
}

class _ScholarshipDetailState extends ConsumerState<ScholarshipDetail> {
  @override
  Widget build(BuildContext context) {
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
        func: () {
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.all(width / 12),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                "MahaDBT ressssssr",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: (3 * width) / 30,
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
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc a turpis id nulla euismod posuere sit amet vitae mi. Fusce vitae gravida dolor. Etiam ac tellus nibh. Vivamus congue neque vel ligula convallis ullamcorper.",
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
                      title: "25 Mar 2022",
                      isHalf: true,
                      content: "Hindu",
                      icon: FontAwesomeIcons.graduationCap,
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
                      content: "16 Aug 2022",
                      icon: FontAwesomeIcons.graduationCap,
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
                      content: "Hindu",
                      icon: FontAwesomeIcons.graduationCap,
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
                      content: ">75%",
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
                    flex: 6,
                    child: ProfileTile(
                      title: "Academic Score",
                      isHalf: true,
                      content: ">9.4 CGPA",
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
                      content: "Maratha",
                      icon: FontAwesomeIcons.graduationCap,
                    ),
                  ),
                ],
              ),
              SizedBox(height: space*5,)
            ],
          ),
        ),
      ),
    );
  }
}
