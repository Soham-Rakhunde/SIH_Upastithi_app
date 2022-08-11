import 'package:flutter/material.dart';

class centeredLargeFAB extends StatelessWidget {
  const centeredLargeFAB({
    Key? key,
    required this.size, required this.text, required this.func, required this.color, required this.textColor,
  }) : super(key: key);

  final Size size;
  final String text;
  final VoidCallback func;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: size.width*0.8,
        height: size.height*0.08,
        padding: EdgeInsets.all(size.width*0.04),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size.width*0.05)
        ),
        child: FittedBox(
          child: Text(text,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700
            ),),
        ),
      ),
    );
  }
}