import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/presentation/screens/settings/faq_screen.dart';
import 'package:odc/presentation/screens/settings/logout_screen.dart';
import 'package:odc/presentation/screens/settings/partenrs_screen.dart';
import 'package:odc/presentation/screens/settings/support_screen.dart';
import 'package:odc/presentation/screens/settings/term_Screen.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:odc/presentation/widgets/navigetor.dart';

import '../../../bussiness_logic/settings/cubit.dart';
import '../../../bussiness_logic/settings/state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return BlocConsumer<SettingCubit,SettingState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(

          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height/15,
                horizontal: size.width/20
            ),
            child: Column(
              children: [
                Center(
                  child: DefaultText(
                    text: "Settings",
                    fontWeight: FontWeight.w500,
                    fontSize: size.width*0.085,
                  ),
                ),
                SizedBox(height:size.height/20 ,),
                buildInkWell(size,(){
                  navigateTo(context, const FAQScreen());
                },'FAQ',),
                buildDivder(size),
                buildInkWell(size,(){
                  navigateTo(context,const TermScreen());
                },'Terms & Conditions',),
                buildDivder(size),
                buildInkWell(size,(){
                  navigateTo(context, const PartenrsScreen());
                },'Our Partners',),
                buildDivder(size),
                buildInkWell(size,(){
                  navigateTo(context, SupportScreen());
                },'Support',),
                buildDivder(size),
                buildInkWell(size,(){
                  showDialog(
                      context: context,
                      builder: (context)=>const LogoutScreen());
                },'Log out',),
              ],
            ),
          ),
        );
      },
    );
  }

  Container buildDivder(Size size) {
    return Container(
            margin: EdgeInsets.symmetric(
              vertical: size.height/35
            ),
            height: size.height/500,
            color: Colors.grey.shade300,
          );
  }

  InkWell buildInkWell(Size size,onTap,text) {
    return InkWell(
            onTap: onTap,
            child: Row(
              children: [
                DefaultText(
                  text: text,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width*0.05,
                ),
      const         Spacer(),
                const Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,)
              ],
            ),
          );
  }
}