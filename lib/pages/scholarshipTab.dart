
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/common_widgets/scholarshipListTile.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';
import 'package:sih_student_app/services/scholarships/scholarship_model.dart';

class ScholarshipTab extends ConsumerWidget {
  const ScholarshipTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    ScholarshipModel scholarshipModel = ref.watch(scholarshipController);
    return Container(
      color: scholarshipColor,
      padding: EdgeInsets.all(size.width * 0.08),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
              child: FittedBox(
                fit: BoxFit.fitWidth,
              child: Text(
                "Scholarships",
                style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
              ),
          ),
            ),),
          // Spacer(flex: 1,),
          ScholarshipListTile(color: Colors.lightGreen),
          ScholarshipListTile(color: Colors.deepPurple),
          ScholarshipListTile(color: Colors.deepOrange,),
          ScholarshipListTile(color: Colors.yellow,),
          ScholarshipListTile(color: Colors.blue,),
          ScholarshipListTile(color: Colors.teal,),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}