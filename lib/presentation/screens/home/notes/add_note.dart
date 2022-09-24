import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/bussiness_logic/note/cubit.dart';
import 'package:odc/bussiness_logic/note/state.dart';
import 'package:odc/presentation/constants/app_colors.dart';
import 'package:odc/presentation/widgets/default_AppBar.dart';
import 'package:odc/presentation/widgets/default_button.dart';
import 'package:odc/presentation/widgets/default_textFormfield.dart';
class AddNoteScreen extends StatelessWidget {
   AddNoteScreen({Key? key}) : super(key: key);

   final x=GlobalKey<ScaffoldState>();
   final titleController=TextEditingController();
   final desController =TextEditingController();
  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return BlocConsumer<NoteCubit,NoteState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<NoteCubit>(context);
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: buildAppBar(context, "Add Note"),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height/20,
                  left: size.width/20,
                  right:   size.width/20,
                ),
                child: DefaultTextFromField(
                    controller: titleController,
                    isPassword: false,
                    hint: 'Title',
                    type: TextInputType.text,
                    onChange: (val){},
                    obscureText: false),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height/20,
                  horizontal: size.width/20,

                ),
                child: DefaultTextFromField(
                    controller: desController,
                    isPassword: false,
                    maxLines: 5,
                    hint: 'Description',
                    type: TextInputType.text,
                    onChange: (val){},

                    obscureText: false),
              ),
              Center(
                child: DefaultButton(
                    AppColors.primaryColor,
                    size.height/16,
                    size.width*0.065,
                    10, Colors.white,
                    size.width/4
                    , 'Add',
                        (){
                      cubit.insertDB(context,titleController.text,desController.text);
                    }, true),
              )
            ],
          ),
        );
      },
    );

  }

}
