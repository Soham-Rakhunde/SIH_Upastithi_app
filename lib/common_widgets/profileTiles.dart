import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih_student_app/services/colors.dart';

class ProfileTile extends StatelessWidget {
  Widget? child;
  double? width, height;
  String title, content;
  bool isHalf;
  IconData icon;
  ProfileTile(
      {Key? key,
      this.child,
      this.width,
      this.height,
      this.isHalf = false,
      required this.title,
      required this.content,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? double.infinity,
      height: height ?? size.height * 0.095,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(size.width * 0.04),
          // boxShadow: boxShadow
      ),
      child: Row(
        children: [
          Spacer(flex: isHalf?3:2),
          Expanded(
            flex: isHalf?4:2,
            child: FittedBox(child: FaIcon(icon)),
          ),
          Expanded(
            flex: isHalf?26:25,
            child: Column(
              children: [
                Spacer(),
                ListTile(
                  title: Text(
                    title,
                    style: TextStyle(color: Colors.black38,
                        fontWeight: FontWeight.w600, fontSize: size.width / 25),
                  ),
                  subtitle: Text(
                    content,
                    style: TextStyle(color: Colors.black87,
                        fontWeight: FontWeight.w600, fontSize: size.width / 24),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
