import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/presentation/widgets/default_AppBar.dart';
//
import 'package:simple_html_css/simple_html_css.dart';

import '../../../bussiness_logic/settings/cubit.dart';
import '../../../bussiness_logic/settings/state.dart';
class TermScreen extends StatelessWidget {
  const TermScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return BlocConsumer<SettingCubit,SettingState>(
       listener: (context,state){},
       builder: (context,state){
         var cubit=BlocProvider.of<SettingCubit>(context);
         var text=cubit.termsModel!.data!.terms ?? "no";
         return state is GetTermsDataLoadingState?
          Scaffold(
            backgroundColor: Colors.white,
           appBar: buildAppBar(context, "Term & Conditions"),
           body:  const Center(
             child: Text("Loading"),
           ),
         ):Scaffold(
           backgroundColor: Colors.white,
           appBar: buildAppBar(context, "Term & Conditions"),
           body: ListView(
             children: [
               Container(
                 padding: EdgeInsets.all(
                     size.width/30
                 ),
                 margin: EdgeInsets.symmetric(
                     horizontal: size.width/20,
                     vertical: size.height/90
                 ),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.black12
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     // Center(
                     //   child: DefaultText(
                     //     text: 'Terms and Conditions',
                     //     fontWeight: FontWeight.w400,
                     //     color: Colors.grey[600],
                     //     fontSize: size.width*0.06,
                     //   ),
                     // ),
                     SizedBox(height: size.height/50,),
                     RichText(

                       text: HTML.toTextSpan(context, text,
                         defaultTextStyle: TextStyle(
                         color: Colors.grey[600],
                         fontSize: size.width*0.04,
                         decorationColor: Colors.black.withOpacity(0.002)
                         // etc etc
                       ), ),

                     )
                   ],
                 ),
               ),
             ],
           ),
         )

         ;
       },
    );
  }
}
