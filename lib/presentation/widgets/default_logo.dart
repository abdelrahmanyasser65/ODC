import 'package:flutter/material.dart';

import '../constants/images.dart';

class DefaultLogo extends StatelessWidget {
  const DefaultLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Image.asset(
      logo,
      height: size.height / 12,
    );
  }
}
