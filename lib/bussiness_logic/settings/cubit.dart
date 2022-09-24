import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/bussiness_logic/settings/state.dart';
import 'package:odc/data/models/term_model.dart';
import 'package:odc/presentation/constants/end_points.dart';

import '../../../data/remote/dio_helper.dart';
import '../../../presentation/screens/settings/faq_screen.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);
  TermsModel? termsModel;

  getTermsData() {
    emit(GetTermsDataLoadingState());
    DioHelper.getData(
      url: termsEndPoint,
    ).then((value) {
      termsModel = TermsModel.fromJson(value.data);
      print(value.toString());
      emit(GetTermsDataSuccessState());
    }).catchError((e) {
      emit(GetTermsDataErrorState());
    });
  }

  List itemsExpanded = [
    Item(
        header: 'Q1: How many countries Orange Digital Center is in ? ',
        body: "16 Country",
        isExpanded: false),
  ];

  void changeExpanded(index, isExpanded) {
    itemsExpanded[index].isExpanded = !isExpanded;
    emit(ChangeExpandedState());
  }
}
