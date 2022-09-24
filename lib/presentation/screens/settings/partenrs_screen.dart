import 'package:flutter/material.dart';
import 'package:odc/presentation/widgets/default_AppBar.dart';
import 'package:odc/presentation/widgets/default_logo.dart';
import 'package:odc/presentation/widgets/default_text.dart';

import '../../constants/app_colors.dart';
class PartenrsScreen extends StatelessWidget {
  const PartenrsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(context, "Our Partners"),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width/17,
          vertical: size.height/40
        ),
        children: [
          Container(
            height: size.height/3.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.grey.shade400,
                  Colors.white,
                  Colors.grey.shade400
                ],            ),
          ),
            padding: EdgeInsets.all(size.width*0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: 'ODC',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width*0.08,
                ),
                SizedBox(height: size.height/20,),
              const  DefaultLogo(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
