import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/bussiness_logic/home_cubit/cubit.dart';
import 'package:odc/bussiness_logic/home_cubit/state.dart';
import 'package:odc/presentation/constants/images.dart';
import 'package:odc/presentation/widgets/default_logo.dart';
import 'package:odc/presentation/widgets/home_car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cards = [
    HomeCard(text: 'Lectures', image: lecture, index: 0),
    HomeCard(text: 'Sections', image: sections, index: 1),
    HomeCard(text: 'Midterms', image: midterm, index: 2),
    HomeCard(text: 'Finals', image: finals, index: 3),
    HomeCard(text: 'Events', image: event, index: 4),
    HomeCard(text: 'Notes', image: notes, index: 5),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit,HomeState>(
    listener: (context,state){},
    builder: (context,state){
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 5,
            right: 5,
          ),
          child: ListView(
            children: [
              const DefaultLogo(),
              GridView.count(
                padding: const EdgeInsets.all(7),
                mainAxisSpacing: 5,
                crossAxisSpacing: 11,
                childAspectRatio: 1 / 0.80,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: cards,
              ),
            ],
          ),
        ),
      );
    },
    );
  }
}
