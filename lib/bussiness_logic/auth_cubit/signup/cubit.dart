

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc/bussiness_logic/auth_cubit/signup/state.dart';
import 'package:odc/data/remote/dio_helper.dart';
import 'package:odc/presentation/constants/end_points.dart';
import 'package:odc/presentation/screens/auth/login_screen.dart';
import 'package:odc/presentation/widgets/navigetor.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  bool isShowPassword=false;
  bool isShowConPassword=false;
  void showPassword(){
    isShowPassword=!isShowPassword;
    emit(ShowPasswordState());
  }
  void showConPassword(){
    isShowConPassword=!isShowConPassword;
    emit(ShowPasswordState());
  }
  String  genderValue = "Male";
  String universityValue = "AUC";
  void onChangeGender(val){
    genderValue=val.toString();
    emit(GenderState());
  }
  void onChangedUniversity(val){
    universityValue=val.toString();
    emit(UniversityState());
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  void validation(){

    if(nameController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Enter Your Name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if(emailController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Enter Your Email ",
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
    else if (confirmPasswordController.text!=passwordController.text){
      Fluttertoast.showToast(
          msg: "Confirm Password is not right",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if(phoneNumberController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Enter Your phone Number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  Future postSignup(context) async {
    var json = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "phoneNumber": phoneNumberController.text,
      "gender": genderValue == 'Male' ? 'm' : 'f',

    };


    DioHelper.postData(url: registerEndPoint, data: json).then((value) {
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Successfully Signup",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        navigateAndFinish(context,const LoginScreen());
      }
      emit(RegisterSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(RegisterErrorState());
    });
  }


}