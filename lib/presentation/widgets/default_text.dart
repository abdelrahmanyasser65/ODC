import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({Key? key, this.maxLines=1,this.color,  this.fontWeight,required this.text, this.fontSize,this.textOverflow})
      : super(key: key);
 final String text;
 final Color? color;
 final int?maxLines;
 final double? fontSize;
 final FontWeight?fontWeight;
 final TextOverflow ?textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
    );
  }
}
