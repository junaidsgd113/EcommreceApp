import 'package:flutter/material.dart';
Widget customText(Color color,String text,FontWeight fontWeight,double fontSize){
  return Text(
    text,
    style: TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight,fontStyle:FontStyle.normal ),
  );
}

