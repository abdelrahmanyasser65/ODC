import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc/bussiness_logic/auth_cubit/login/cubit.dart';
import 'package:odc/bussiness_logic/auth_cubit/login/state.dart';
import 'package:odc/data/local/cache_helper.dart';
import 'package:odc/presentation/constants/app_colors.dart';
import 'package:odc/presentation/screens/auth/register_screen.dart';
import 'package:odc/presentation/widgets/build_divder.dart';
import 'package:odc/presentation/widgets/default_button.dart';
import 'package:odc/presentation/widgets/default_logo.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:odc/presentation/widgets/default_textFormfield.dart';
import 'package:odc/presentation/widgets/navigetor.dart';

import '../../constants/constants.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return BlocConsumer<LoginCubit,LoginState>
      (
      listener: (context,state){
        if (state is LoginSuccessState) {
          if (state.loginModel.code=='Success') {
            CacheHelper.put(key: 'token', value: state.loginModel.data!.accessToken)
                .then((value) {
              token=state.loginModel.data!.accessToken!;

            });
          } else {
            Fluttertoast.showToast(
                msg: 'Invalid Data',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
      builder: (context,state){
        var cubit=BlocProvider.of<LoginCubit>(context);
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
                  vertical: size.height/9,

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'Login',
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.1,
                      color: AppColors.black,
                    ),
                    SizedBox(height: size.height/40,),
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
                    SizedBox(height: size.height/50,),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                       fontSize: size.width/25,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline
                      ),

                    ),
                    SizedBox(height: size.height/13,),
                    DefaultButton(
                        AppColors.primaryColor,
                        55.0,
                        size.width*0.06,
                        9.0,
                        AppColors.white,
                        double.infinity,
                        'Login',
                        (){
                          cubit.validation();
                          cubit.postLogin(context);

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
                        'Sign Up',
                            (){
                      navigateTo(context, const RegisterScreen());
                      cubit.emailController.text='';
                      cubit.passwordController.text='';
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
