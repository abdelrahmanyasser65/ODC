import 'package:flutter/material.dart';
import 'package:odc/presentation/widgets/default_AppBar.dart';
import 'package:odc/presentation/widgets/default_button.dart';

import '../../constants/app_colors.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(context, "Support"),
      body: ListView(
        padding: EdgeInsets.all(size.height / 30),
        children: [
          buildTextFormField(
            size: size,
            controller: nameController,
            keyboardType: TextInputType.name,
            text: 'Name',
            icon: Icons.person,
          ),
          SizedBox(
            height: size.height / 30,
          ),
          buildTextFormField(
            size: size,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            text: 'E-Mail',
            icon: Icons.email,
          ),
          SizedBox(
            height: size.height / 30,
          ),
          buildTextDes(size),
          SizedBox(
            height: size.height / 25,
          ),
          DefaultButton(
              AppColors.primaryColor,
              size.height / 16,
              size.width * 0.065,
              10,
              Colors.white,
              double.infinity,
              'Submit',
              () {},
              true)
        ],
      ),
    );
  }

  TextFormField buildTextDes(Size size) {
    return TextFormField(
      controller: desController,
      keyboardType: TextInputType.text,
      maxLines: 5,
      decoration: InputDecoration(
        filled: true,
        hintText: "What's making you unhappy?",
        fillColor: Colors.black.withOpacity(0.09),
        labelStyle: TextStyle(
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.w400,
          //color:Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade400)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade400)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade400)),
      ),
    );
  }

  TextFormField buildTextFormField(
      {size, controller, keyboardType, maxLines, text, icon, hint}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.primaryColor,
      onChanged: (val) {},
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700),
      maxLines: maxLines,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade400)),
        filled: true,
        hintText: hint,
        fillColor: Colors.black.withOpacity(0.09),
        labelStyle: TextStyle(
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.w400,
          //color:Colors.grey,
        ),
        label: Text(text),
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade400)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade400)),
      ),
    );
  }
}
