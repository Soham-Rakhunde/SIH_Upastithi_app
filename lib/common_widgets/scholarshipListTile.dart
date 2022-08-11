
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/services/colors.dart';

class ScholarshipListTile extends ConsumerWidget {
  ScholarshipListTile({Key? key,required this.color}) : super(key: key);

  Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    double height = size.height*0.1;
    return Container(
      width: size.width,
      height: height,
      padding: EdgeInsets.all(size.width*0.04),
      margin:EdgeInsets.symmetric(vertical:size.height*0.01),
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
                borderRadius:
                BorderRadius.circular(size.width * 0.06),
              ),
            ),
          ),
          Expanded(
            flex: 24,
            child: Column(
              children: [
                Spacer(),
                Expanded(
                  flex: 50,
                  child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text(
                      "Maha DBT Rsed",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: size.width / 24),
                    ),
                    subtitle: Text(
                      "24 Jul 2022",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: size.width / 24),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          Spacer(),
          Container(
            width: height - size.width*0.06,
            height: height - size.width*0.04,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
              BorderRadius.circular(size.width * 0.03),
            ),
          ),
        ],
      ),
    );
  }
}
