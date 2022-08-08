import 'package:flutter/material.dart';
import 'package:sih_student_app/services/colors.dart';

class RoundedContainer extends StatelessWidget {
  Size size;
  Widget? child;
  RoundedContainer({Key? key, required this.size, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: EdgeInsets.all(size.width * 0.05),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(size.width * 0.08),
          boxShadow: boxShadow),
      child: child,
    );
  }
}

class FittedText extends StatelessWidget {
  FontWeight weight;
  String text;
  FittedText(this.text, {Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FittedBox(
      child: Text(
        text,
        style: TextStyle(fontWeight: weight, color: textColor),
      ),
    );
  }
}
