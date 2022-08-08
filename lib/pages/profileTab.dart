import 'package:flutter/material.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/roundedContainer.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          // const Expanded(
          //   flex: 2,
          //   child: FittedBox(
          //     child: Text(
          //       "Profile",
          //       style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
          //     ),
          //   ),
          // ),
          const Spacer(
            flex: 1,
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
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(size.width * 0.06),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: FittedText(
                  "Soham Rakhunde",
                  weight: FontWeight.w900,
                )
              )),
          Expanded(
            flex:9,
            child: RoundedContainer(
              size: size,
              child: Padding(
                padding:  EdgeInsets.all(size.width*0.03),
                child: Column(
                  children: [
                    Expanded(
                      child: FittedText(
                        "Email: soham.rak@gmail.com",
                        weight: FontWeight.w500,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Expanded(
                      child: FittedText(
                        "Class: BE1    |    Roll:41168",
                        weight: FontWeight.w500,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Expanded(
                      child: FittedText(
                        "Enrollment: C2K19106350",
                        weight: FontWeight.w500,
                      ),
                    ),
                    const Divider(
                    thickness: 2,
                    ),
                    Expanded(
                      child: FittedText(
                        "Deparment: Computer Engineering",
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
