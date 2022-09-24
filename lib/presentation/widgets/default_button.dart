import 'package:flutter/material.dart';
import 'package:odc/presentation/constants/app_colors.dart';

class DefaultButton extends StatelessWidget {
final String text;
final  Color textColor;
final  onPressed;
final double height;
final double width;
final double radius;
final double fontSize;
final Color primary;
final bool isFull;

const DefaultButton(
    this.primary,
this.height,
this.fontSize,
this.radius,
this.textColor,
this.width,
this.text,

this.onPressed,
   this.isFull,
    {Key? key}
) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      style: ElevatedButton.styleFrom(
        elevation:isFull? 3:0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side:isFull?const BorderSide(
            width: 0,
            color: AppColors.primaryColor
          ):const BorderSide(
            width: 2,
            color: AppColors.primaryColor
          )
        ),
        primary:primary,
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: fontSize,
                color:textColor
            ),
          ),
        ),
      ),
    );
  }
}
