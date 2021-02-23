import 'package:flutter/material.dart';
import 'package:washbox/other/colors.dart';

OutlineInputBorder inputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: inputTextColor),
    borderRadius: const BorderRadius.all(
      const Radius.circular(10.0),
    ),);
}

