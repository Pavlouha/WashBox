import 'package:flutter/material.dart';
import 'package:washbox/other/colors.dart';

Widget toast({BuildContext context, String text}) {
  return SnackBar(backgroundColor: backgroundColor,
      content: Container(margin: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
        ),
        child: Text(text, style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),),
      )
  );
}