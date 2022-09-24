import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc/bussiness_logic/auth_cubit/signup/cubit.dart';
import 'package:odc/bussiness_logic/auth_cubit/signup/state.dart';
import 'package:odc/presentation/screens/auth/login_screen.dart';
import 'package:odc/presentation/widgets/navigetor.dart';

import '../../constants/app_colors.dart';
import '../../widgets/build_divder.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_logo.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_textFormfield.dart';

class RegisterScreen extends StatelessWidget {
   const RegisterScreen({Key? key}) : super(key: key);



   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context,state){
      if(state is RegisterErrorState){
        Fluttertoast.showToast(
            msg: "This Email is Used",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);}
      },
      builder: (context,state){
        var cubit=BlocProvider.of<RegisterCubit>(context);
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.symmetric(
                vertical: size.height/17,
                horizontal: size.width/15
            ),
            children:  [
              const DefaultLogo(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height/14,

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'Sign Up',
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.1,
                      color: AppColors.black,
                    ),
                    SizedBox(height: size.height/40,),
                    DefaultTextFromField(
                        isPassword: false,
                        controller: cubit.nameController,
                        hint: 'Name',
                        type: TextInputType.name,
                        onChange: (val){},
                        obscureText: false),
                    SizedBox(height: size.height/35,),
                    DefaultTextFromField(
                        isPassword: false,
                        controller: cubit.emailController,
                        hint: 'E-Mail',
                        type: TextInputType.emailAddress,
                        onChange: (val){},
                        obscureText: false),
                    SizedBox(height: size.height/35,),
                    DefaultTextFromField(
                        isPassword: true,
                        controller: cubit.passwordController,
                        hint: 'Password',
                        maxLines: 1,
                        type: TextInputType.visiblePassword,
                        onChange: (val){},
                        obscureText:cubit.isShowPassword? false:true,
                        suffixWidget:InkWell(
                          onTap: (){
                            cubit.showPassword();
                          },
                          child: Icon(
                            cubit.isShowPassword?Icons.visibility:Icons.visibility_off ,
                            color: AppColors.primaryColor,
                          ),
                        )
                    ),
                    SizedBox(height: size.height/35,),
                    DefaultTextFromField(
                      maxLines: 1,
                        isPassword: true,
                        controller: cubit.confirmPasswordController,
                        hint: 'Confirm Password',
                        type: TextInputType.visiblePassword,
                        onChange: (val){},
                        obscureText:cubit.isShowConPassword? false:true,
                        suffixWidget:InkWell(
                          onTap: (){
                            cubit.showConPassword();
                          },
                          child: Icon(
                            cubit.isShowConPassword?Icons.visibility:Icons.visibility_off ,
                            color: AppColors.primaryColor,
                          ),
                        )
                    ),
                    SizedBox(height: size.height/35,),
                    DefaultTextFromField(
                        isPassword: false,
                        controller: cubit.phoneNumberController,
                        hint: 'Phone Number',
                        type: TextInputType.phone,
                        onChange: (val){},
                        obscureText:false,

                    ),
                    SizedBox(height: size.height/35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            DefaultText(
                              text: "Gender",
                              fontSize: size.width*0.06,
                               fontWeight: FontWeight.w500,
                            ),
                            Container(
                              height: size.height/17,
                              width: size.width/4,
                              padding:  EdgeInsets.all(size.height/150),
                              margin: EdgeInsets.only(top: size.height/80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.primaryColor),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: ["Male", "Female"].map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          fontSize: size.width*0.043,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    cubit.onChangeGender(value);
                                  },
                                  value: cubit.genderValue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                            children: [
                              DefaultText(
                                text: "University",
                                fontSize: size.width*0.06,
                                fontWeight: FontWeight.w500,
                              ),
                              Container(
                                height: size.height/17,
                                width: size.width/4,
                                padding:  EdgeInsets.all(size.height/150),
                                margin: EdgeInsets.only(top: size.height/80),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.primaryColor),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    items: ["AUC", "FCIH", "FCAI", "SUEZ"].map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                              fontSize: size.width*0.043,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      cubit.onChangedUniversity(value);
                                    },
                                    value: cubit.universityValue,
                                  ),
                                ),
                              ),]),
                      ],
                    ),
                    SizedBox(height: size.height/20,),
                    DefaultButton(
                        AppColors.primaryColor,
                        55.0,
                        size.width*0.06,
                        9.0,
                        AppColors.white,
                        double.infinity,
                        'Sign Up',
                            () {
                          cubit.validation();
                          cubit.postSignup(context);
                        },
                        true
                    ),
                    SizedBox(height: size.height/30,),
                    Row(
                      children: [
                        const Expanded(child: BuildDivider()),
                        SizedBox(width: size.width/47,),
                        Text(
                          'OR ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width*0.06,
                          ),
                        ),
                        const Expanded(child: BuildDivider()),
                      ],
                    ),
                    SizedBox(height: size.height/30,),
                    DefaultButton(
                        AppColors.white,
                        55.0,
                        size.width*0.06,
                        9.0,
                        AppColors.primaryColor,
                        double.infinity,
                        'Login',
                            (){
                          navigateTo(context, const LoginScreen());
                           cubit.passwordController.text='';
                           cubit.emailController.text='';
                           cubit.nameController.text='';
                           cubit.confirmPasswordController.text='';
                           cubit.phoneNumberController.text='';
                           cubit.genderValue='Male';
                            },
                        false
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}