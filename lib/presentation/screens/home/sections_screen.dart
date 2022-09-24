import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/presentation/widgets/default_carList.dart';

import '../../../bussiness_logic/home_cubit/cubit.dart';
import '../../../bussiness_logic/home_cubit/state.dart';
import '../../constants/app_colors.dart';
import '../../widgets/default_AppBar.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<HomeCubit>(context);
        var model=cubit.lecturesModel!.data;
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: buildAppBar(context, "Sections"),
          body:
          state is GetAllLecturesLoadingState?
          const Center(
            child: CircularProgressIndicator(),
          ):
          ListView.separated(
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return buildCard(size,
                    model![index].lectureSubject,
                    model[index].lectureDate,
                    model[index].lectureStartTime,
                    model[index].lectureEndTime
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(height: size.height/150,);
              },
              itemCount: model!.length),
        );
      },

    );
  }


}

