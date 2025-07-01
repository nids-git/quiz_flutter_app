
import 'package:flutter/cupertino.dart';

class CommonTextStyling extends StatelessWidget{
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CommonTextStyling({super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = CupertinoColors.white
    });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color:color,
      ),
    );
  }
}