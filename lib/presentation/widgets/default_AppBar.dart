import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'default_text.dart';
AppBar buildAppBar(BuildContext context,text) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon:const Icon(Icons.arrow_back_ios,color:AppColors.primaryColor,),
    ),
    title: DefaultText(
      text: text,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.black,
    ),
    centerTitle: true,
  );
}
