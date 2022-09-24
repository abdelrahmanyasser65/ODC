import 'package:flutter/material.dart';
import 'package:odc/presentation/screens/auth/login_screen.dart';
import 'package:odc/presentation/widgets/default_logo.dart';

import '../../widgets/navigetor.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.startWidget}) : super(key: key);

  final Widget startWidget;



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      navigateTo(context,widget.startWidget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white70,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: DefaultLogo(),
      ),
    );
  }
}