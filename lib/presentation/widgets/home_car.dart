import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc/presentation/screens/home/events_screen.dart';
import 'package:odc/presentation/screens/home/midterms_screen.dart';

import '../constants/app_colors.dart';
import '../screens/home/finals_screen.dart';
import '../screens/home/lectures_screen.dart';
import '../screens/home/notes/notes_screen.dart';
import '../screens/home/sections_screen.dart';
import 'default_text.dart';
import 'navigetor.dart';
class HomeCard extends StatelessWidget {
  final String text;
  final String image;
  final int index;
   const HomeCard({Key? key, required this.text, required this.image, required this.index}) : super(key: key);
 final screens=const [
   LecturesScreen(),
   SectionsScreen(),
   MidtermsScreen(),
   FinalsScreen(),
   EventsScreen(),
   NotesScreen(),
 ];
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        navigateTo(context, screens[index]);
      },
      child: SizedBox(
        height: size.height/6.4,
        width: size.width/2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          elevation: 10,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height/65
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28.0,
                  backgroundColor: Colors.black12,
                  child:  SvgPicture.asset(image,
                    color: AppColors.primaryColor,
                    height: size.height/20,
                  ),
                ),
                SizedBox(height: size.height/80,),
                DefaultText(
                  text: text,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
