import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/bussiness_logic/app_layout/state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState>{
  AppLayoutCubit():super(AppLayoutInitialState());
  static AppLayoutCubit get(context)=>BlocProvider.of(context);
}