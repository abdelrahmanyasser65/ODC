import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:odc/bussiness_logic/note/state.dart';
import 'package:odc/data/local/sql_helperl.dart';
import 'package:odc/data/models/note_model.dart';
import 'package:odc/presentation/screens/home/notes/notes_screen.dart';
import 'package:odc/presentation/widgets/navigetor.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitialState());

  static NoteCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  String? title;
  String? description;
  int? id;
  String? date;
  String dateTime = DateFormat("hh:mm a dd/mm/yyyy").format(DateTime.now());
  NotesModel? notesModel;

  Future<dynamic> initialize() async {
    HelperSql.db.then((value) {
      emit(InitialNoteSuccessState());
    }).catchError((e) {
      emit(InitialNoteErrorState());
    });
  }

  Future<dynamic> insertDB(context,tit,des) async {
    HelperSql.insertDB({
      'id': id,
      'title': tit,
      'description': des,
      'date':dateTime,
        }).then((value) {
      navigateAndFinish(context, const NotesScreen());
      emit(InsertNoteSuccessState());

    }).catchError((e) {
      emit(InsertNoteErrorState());
    });
  }

  Future<dynamic> deleteDB(int id) async {
    HelperSql.deleteDB(id).then((val) {
      emit(DeleteNoteSuccessState());
    }).catchError((e) {
      emit(DeleteNoteErrorState());
    });
  }

  Future<dynamic> upDateDB({
    context, id, title, description,
    date}) async {
    HelperSql.updateDB(id,
        title, description,
        date).then((val){
          emit(UpdateNoteSuccessState());
          Navigator.pop(context);
    }).catchError((e){
          emit(UpdateNoteErrorState());
    });
  }

  Future<dynamic>getOneNote(context,
      id,title,description
      )async{
    navigateTo(context,
    //edit
    NotesScreen(),
    );
    HelperSql.getOneRowDB(
        id,
        title,
        description
    );
  }
}
