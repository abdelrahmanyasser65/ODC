import 'package:flutter/material.dart';
import 'package:odc/data/local/cache_helper.dart';
import 'package:odc/presentation/constants/app_colors.dart';
import 'package:odc/presentation/screens/auth/login_screen.dart';
import 'package:odc/presentation/widgets/default_button.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:odc/presentation/widgets/navigetor.dart';
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(
            size.width*0.05
          ),
          height: size.height/4.5,
          width: size.width/1.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             DefaultText(
               text: "Logout",
               fontWeight: FontWeight.w500,
               fontSize: size.width*0.06,
             ),
             SizedBox(height: size.height/40,),
             DefaultText(
               text: "Are you sure ?",
               fontWeight: FontWeight.w400,
               fontSize: size.width*0.05,
             ),
             SizedBox(height: size.height/30,),
             Row(
               children: [
                 Expanded(
                   child: DefaultButton(
                     Colors.white,
                     size.height/20,
                     size.width*0.034,
                     7,
                     AppColors.primaryColor,
                     size.width/10,
                     'cancel',
                       (){
                       Navigator.pop(context);
                       },
                     false
                   ),
                 ),
                const SizedBox(width: 10,),
                 Expanded(
                   child: DefaultButton(
                       AppColors.primaryColor,
                       size.height/20,
                       size.width*0.042,
                       7,
                       AppColors.white,
                       size.width/10,
                       'sure',
                           (){
                         navigateAndFinish(context,const LoginScreen());
                         CacheHelper.removeData(key: 'token');
                           },
                       true
                   ),
                 ),
               ],
             ),
           ],
         ),
        ),
      ),
    );
  }
}
