import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/bussiness_logic/home_cubit/state.dart';
import 'package:odc/data/models/Exam_model.dart';
import 'package:odc/data/models/lectures_model.dart';

import '../../data/models/allNews_model.dart';
import '../../data/remote/dio_helper.dart';
import '../../presentation/constants/constants.dart';
import '../../presentation/constants/end_points.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  void changeBottomNavy(int index){
    currentIndex=index;
    emit(HomeChangeBottomState());
  }
  AllNewsModel ?allNewsModel;
  getAllNewsData(){
    emit(GetAllNewsLoadingState());
    DioHelper.getData(
        url: newsEndPoint,
        token:token
    ).then((value) {
      allNewsModel=AllNewsModel.fromJson(value.data);

      emit(GetAllNewsSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetAllNewsErrorState());
    });
  }

  LecturesModel ?lecturesModel;
  getAllLecturesData(){
    emit(GetAllLecturesLoadingState());
    DioHelper.getData(
        url: lectureEndPoint,
        token:token
    ).then((value) {
      lecturesModel=LecturesModel.fromJson(value.data);
      emit(GetAllLecturesSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetAllLecturesErrorState());
    });
  }


  ExamModel ?examModel;
  getAllExamData(){
    emit(GetAllExamLoadingState());
    DioHelper.getData(
        url: 'exams?date=2022-08-18',
        token:token
    ).then((value) {

        examModel=ExamModel.fromJson(value.data);

      emit(GetAllExamSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetAllExamErrorState());
    });
  }


  ExamModel ?midtermsModel;
  getAllMidtermData(){
    emit(GetAllMidLoadingState());
    DioHelper.getData(
        url: 'exams?date=2022-06-05',
        token:token
    ).then((value) {

      midtermsModel=ExamModel.fromJson(value.data);

      emit(GetAllMidSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetAllMidErrorState());
    });
  }
}