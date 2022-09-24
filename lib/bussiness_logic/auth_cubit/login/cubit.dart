
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc/bussiness_logic/auth_cubit/login/state.dart';
import 'package:odc/data/models/login_model.dart';
import 'package:odc/presentation/app_layout/app_layout.dart';
import 'package:odc/presentation/constants/end_points.dart';

import '../../../data/remote/dio_helper.dart';
import '../../../presentation/widgets/navigetor.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  bool isShowPassword=false;
  void showPassword(){
    isShowPassword=!isShowPassword;
    emit(ShowPasswordState());
  }
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  void validation(){
    if(emailController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Enter Your Email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if(passwordController.text.length<6){
      Fluttertoast.showToast(
          msg: "Short Password ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  LoginModel ?loginModel;
  Future postLogin(context) async {
    var json = {
      "email": emailController.text,
      "password": passwordController.text,

    };


    DioHelper.postData(url: loginEndPoint, data: json).then((value) {
      if (value.statusCode == 200) {
        loginModel=LoginModel.fromJson(value.data);
        Fluttertoast.showToast(
            msg: "Successfully Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        navigateAndFinish(context,const AppLayout());
        emailController.text='';
        passwordController.text='';
      }
      emit(LoginSuccessState(loginModel!));

    }).catchError((e){
      print(e.toString());
      emit(LoginErrorState());
    });
  }

}