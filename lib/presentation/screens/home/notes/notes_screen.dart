import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc/bussiness_logic/note/cubit.dart';
import 'package:odc/bussiness_logic/note/state.dart';
import 'package:odc/data/local/sql_helperl.dart';

import 'package:odc/presentation/constants/app_colors.dart';
import 'package:odc/presentation/screens/home/notes/add_note.dart';
import 'package:odc/presentation/screens/home/notes/edit_screen.dart';
import 'package:odc/presentation/widgets/default_AppBar.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:odc/presentation/widgets/navigetor.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return BlocConsumer<NoteCubit,NoteState>(
    listener: (context,state){
      if(state is DatabaseCreateState){
        NoteCubit().initialize();
        Fluttertoast.showToast(
            msg: 'DB Created',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    },
    builder: (context,state){
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: buildAppBar(context,'Notes'),
        body: FutureBuilder(
          future: HelperSql.getAllRowsDB(),
          builder: (BuildContext context,AsyncSnapshot <dynamic> snapshot){
            if(snapshot.hasData){
              return ListView(
                children: [
                  snapshot.data.length>0? SizedBox(
                    height: size.height/1.1,
                    child: ListView.separated(
                        physics:const BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                          return buildNotes(size,context,index,snapshot.data);
                        },
                        separatorBuilder: (context,index){
                          return SizedBox(height: size.height/1000,);
                        },
                        itemCount:snapshot.data.length),
                  ):
                  noNotes(size),


                ],
              );
            }

            else {
              return Container();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            navigateTo(context, AddNoteScreen());
          },
          child:const Icon(Icons.add),
        ),
      );
    },

    );
  }


  Container buildNotes(Size size,context,index, list) {
    return Container(
         margin: EdgeInsets.symmetric(
           horizontal: size.width/20,
           vertical: size.height/190
         ),

         width: size.width/2,
         child: Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(7.0),
           ),
           elevation: 10,
           color: Colors.white,
           child: Padding(
             padding: EdgeInsets.symmetric(
                 vertical: size.height/40,
               horizontal: size.width/20
             ),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width/2,
                     // width: size.width/2,
                      child: DefaultText(
                        text: list[index].title ,
                        fontWeight: FontWeight.bold,
                          fontSize: size.width*0.05,
                      ),
                    ),


                    SizedBox(height: size.height/90,),
                    SizedBox(
                      width: size.width/2,
                      child: DefaultText(
                        text: list[index].description,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.04,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: size.height/90,),
                    DefaultText(
                      text: list[index].date,
                      fontWeight: FontWeight.w400,
                      fontSize: size.width*0.04,
                      color: Colors.grey[500],
                    ),
                  ],
                ),
                 const Spacer(),
                 InkWell(
                   onTap: (){
                     navigateTo(context, EditDataScreen(
                       id: list[index].id ,
                       title: list[index].title,
                       description: list[index].description,
                     ));
                   },
                   child: Icon(
                     Icons.edit,color: AppColors.primaryColor,
                     size: size.width*0.07,
                   ),
                 ),
                 SizedBox(width: size.width/20,),
                 InkWell(
                   onTap: (){
                  NoteCubit().deleteDB(
                    list[index].id
                  );

                   },
                   child: Icon(
                     Icons.delete,color: AppColors.primaryColor,
                     size: size.width*0.07,
                   ),
                 ),
               ],
             ),
           ),
         ),
       );
  }

 Column noNotes(size){
    return Column(
      children: [
        SizedBox(
          height: size.height/3,
        ),
        Center(
          child: DefaultText(
            text: "There's No Data To Show",
            fontSize: size.width*0.06,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
