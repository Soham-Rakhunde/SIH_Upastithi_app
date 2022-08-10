import 'package:flutter/material.dart';
import 'package:sih_student_app/services/colors.dart';

class RoundedContainer extends StatelessWidget {
  Size size;
  Widget? child;
  double? width, height;
  RoundedContainer({Key? key, required this.size, this.child, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: EdgeInsets.all(size.width * 0.05),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(size.width * 0.08),
          boxShadow: boxShadow),
      child: Center(child: child),
    );
  }
}

class FittedText extends StatelessWidget {
  FontWeight weight;
  String text;
  BoxFit? fit;
  FittedText(this.text, {Key? key, required this.weight, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: fit?? BoxFit.contain,
      child: Text(
        text,
        style: TextStyle(fontWeight: weight, color: textColor),
      ),
    );
  }
}
