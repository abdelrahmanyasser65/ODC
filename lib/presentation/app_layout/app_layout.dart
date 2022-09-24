import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc/bussiness_logic/home_cubit/cubit.dart';
import 'package:odc/bussiness_logic/home_cubit/state.dart';
import 'package:odc/presentation/widgets/default_text.dart';

import '../constants/app_colors.dart';
import '../constants/images.dart';
import '../screens/home/home_screen.dart';
import '../screens/news/news_screen.dart';
import '../screens/settings/settings_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List screens =  [const HomeScreen(),const NewsScreen(), const SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          body: screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavyBar(

              selectedIndex: cubit.currentIndex,
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                    icon: SvgPicture.asset(home),
                    title: const DefaultText(
                      text: 'Home',
                    ),
                    inactiveColor: Colors.black,
                    textAlign: TextAlign.center,
                    activeColor: AppColors.primaryColor),
                BottomNavyBarItem(
                    icon: const Icon(Icons.newspaper_outlined),
                    title: const DefaultText(text: 'News'),
                    textAlign: TextAlign.center,
                    inactiveColor: AppColors.primaryColor,
                    activeColor: AppColors.primaryColor),
                BottomNavyBarItem(
                    icon: SvgPicture.asset(setting),
                    title: const DefaultText(text: 'Settings'),
                    inactiveColor: Colors.black,
                    textAlign: TextAlign.center,
                    activeColor: AppColors.primaryColor),
              ],
              onItemSelected: (index) {
                cubit.changeBottomNavy(index);

              },
            ));
      },
        );
  }
}
