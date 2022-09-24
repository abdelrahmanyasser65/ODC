import 'package:flutter/material.dart';
import 'package:odc/presentation/constants/app_colors.dart';
class DefaultTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  final  onChange;
  final bool obscureText;
 final Widget?suffixWidget;
 final bool isPassword;
 final int ?maxLines;
 final String?label;
  const DefaultTextFromField({Key? key,this.maxLines,this.label,required this.controller,required this.isPassword, required this.hint, required this.type, required this.onChange, required this.obscureText, this.suffixWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      keyboardType: type,
      maxLines: maxLines,
      cursorColor: AppColors.primaryColor,
      onChanged:onChange,
       obscureText: obscureText,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.w400,

            //color:Colors.grey,
        ),

          suffixIcon:isPassword?
           suffixWidget:null,
         label: Text(hint),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(15),
           borderSide:const BorderSide(
             width: 1.5,
             color: Colors.grey
           ),
         ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:const BorderSide(
              width: 1.5,
              color: AppColors.primaryColor
          ),
        ),
      ),
    );
  }
}
