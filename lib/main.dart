import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/bussiness_logic/auth_cubit/login/cubit.dart';
import 'package:odc/bussiness_logic/auth_cubit/signup/cubit.dart';
import 'package:odc/bussiness_logic/home_cubit/cubit.dart';
import 'package:odc/bussiness_logic/note/cubit.dart';
import 'package:odc/data/local/sql_helperl.dart';
import 'package:odc/presentation/app_layout/app_layout.dart';
import 'package:odc/presentation/constants/app_colors.dart';
import 'package:odc/presentation/constants/constants.dart';
import 'package:odc/presentation/screens/auth/login_screen.dart';
import 'package:odc/presentation/screens/auth/splash_screen.dart';
import 'bussiness_logic/settings/cubit.dart';
import 'data/local/cache_helper.dart';
import 'data/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.get(key: 'token')??'';
  HelperSql.initialDB();
  Widget widget;
  if(token.isNotEmpty){
    widget=const AppLayout();
  }else{
    widget=const LoginScreen();
  }

  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({Key? key,
    required this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(
        create: (context)=>NoteCubit(),
    ),
          BlocProvider(
            create: (context) => HomeCubit()..getAllNewsData()..
            getAllLecturesData()..getAllExamData()..getAllMidtermData(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => SettingCubit()..getTermsData(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ODC',
          theme: ThemeData(
              outlinedButtonTheme: OutlinedButtonThemeData(
                  style: OutlinedButton.styleFrom(
                primary: AppColors.primaryColor,
                side: const BorderSide(color: AppColors.primaryColor),
              )),
              primaryColor: AppColors.primaryColor,
              primarySwatch: Colors.deepOrange,
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor)))),
          home:
          SplashScreen(startWidget: startWidget,),
        ));
  }
}
