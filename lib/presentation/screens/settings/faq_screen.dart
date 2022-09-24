import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/presentation/constants/app_colors.dart';
import 'package:odc/presentation/widgets/default_text.dart';

import '../../../bussiness_logic/settings/cubit.dart';
import '../../../bussiness_logic/settings/state.dart';
import '../../widgets/default_AppBar.dart';



class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingState>(
        listener: (context,state){},
      builder: (context,state){
          var size=MediaQuery.of(context).size;
          var cubit=BlocProvider.of<SettingCubit>(context);
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: buildAppBar(context, "FAQ"),
            body: ListView(
              children: [

                Container(

                    margin: EdgeInsets.only(
                        left: size.width/15,
                      right: size.width/15,
                      top: size.height/30,
                    ),

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:  ExpansionPanelList(
                      elevation: 6,

                      expansionCallback: (int index, bool isExpanded) {
                        cubit.changeExpanded(index, isExpanded);
                      },
                      children: cubit.itemsExpanded.map<ExpansionPanel>(( item) {
                        return ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: DefaultText(
                                text: item.header,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                          body:  ListTile(
                              title: Text(
                                item.body,
                                textAlign: TextAlign.center,
                                style:const TextStyle(
                                    fontWeight: FontWeight.w500
                                ),
                              )

                          ),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    )
                ),
              ],
            ),
          );
      },

    );
  }
}

class Item {
  final String header;
  final String body;
  bool isExpanded;

  Item({required this.header, required this.body,  this.isExpanded=false});
}
