import 'package:flutter/material.dart';
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) =>
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>widget),
            (route) => false);
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
