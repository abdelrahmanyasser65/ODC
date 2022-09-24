import 'package:flutter/material.dart';
import 'package:odc/presentation/widgets/default_text.dart';

Container buildCard( size,title,date,startTime,endTime) {

  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: size.width/20,
        vertical: size.height/190
    ),

    width: size.width/2,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      elevation: 13,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height/40,
            horizontal: size.width/20
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width/2,
                  // width: size.width/2,
                  child: DefaultText(
                    text:title,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width*0.06,
                  ),
                ),


                SizedBox(height: size.height/90,),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined,
                      color: Colors.black38,size: size.width*0.055,),
                    SizedBox(
                      width: size.width/40,
                    ),
                    DefaultText(
                      text: date,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width*0.04,
                      color: Colors.black38,
                    )
                  ],
                ),
                SizedBox(height: size.height/70,),
                Row(
                  children: [
                    buildRow(size,true,startTime),
                    SizedBox(width: size.width/10,),
                    buildRow(size,false,endTime)
                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    ),
  );
}

Row buildRow(Size size,isStart,time) {
  return Row(
    children: [
      Icon(
        isStart?    Icons.watch_later_outlined:
        Icons.watch_later_rounded,
        color: Colors.black38,
        size: size.width*0.055,),
      SizedBox(width: size.width/40,),
      DefaultText(
        text: time,
        fontWeight: FontWeight.w400,
        fontSize: size.width*0.04,
        color: Colors.black38,
      ),
    ],
  );
}