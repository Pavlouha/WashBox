import 'package:flutter/material.dart';
import 'package:washbox/other/colors.dart';

OutlineInputBorder inputBorder({double radius=10.0}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: inputTextColor),
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),);
}

