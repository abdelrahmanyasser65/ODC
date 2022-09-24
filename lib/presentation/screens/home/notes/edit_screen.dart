import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:odc/presentation/widgets/default_AppBar.dart';

import '../../../../bussiness_logic/note/cubit.dart';
import '../../../../bussiness_logic/note/state.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_textFormfield.dart';

class EditDataScreen extends StatelessWidget {
  final String title;
  final String dateTime =
      DateFormat("hh:mm a dd/mm/yyyy").format(DateTime.now());
  final int id;
  final String description;

  EditDataScreen(
      {Key? key,
      required this.title,
      required this.id,
      required this.description})
      : super(key: key);
  final titleController = TextEditingController();
  final desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = title;
    desController.text = description;
    var size = MediaQuery.of(context).size;
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: buildAppBar(context, "Edit"),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height / 20,
                  left: size.width / 20,
                  right: size.width / 20,
                ),
                child: DefaultTextFromField(
                    controller: titleController,
                    isPassword: false,
                    hint: 'Title',
                    type: TextInputType.text,
                    onChange: (val) {},
                    obscureText: false),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height / 20,
                  horizontal: size.width / 20,
                ),
                child: DefaultTextFromField(
                    controller: desController,
                    isPassword: false,
                    maxLines: 5,
                    hint: 'Description',
                    type: TextInputType.text,
                    onChange: (val) {},
                    obscureText: false),
              ),
              Center(
                child: DefaultButton(
                    AppColors.primaryColor,
                    size.height / 16,
                    size.width * 0.065,
                    10,
                    Colors.white,
                    size.width / 4,
                    'Edit', () {
                  NoteCubit().upDateDB(
                    context: context,
                    id: id,
                    title: titleController.text,
                    description: desController.text,
                    date: dateTime,
                  );
                }, true),
              )
            ],
          ),
        );
      },
    );
  }
}
