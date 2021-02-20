import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:washbox/logic/phone_number_formatter.dart';

Widget numberWidget(String title, TextEditingController textController) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        IntlPhoneField(
          inputFormatters: [PhoneNumberFormatter()],
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: title,
            fillColor: HexColor('#bebebe'),
            filled: true,
            border: InputBorder.none,
          ),
          initialCountryCode: 'RU',
          controller: textController,
          onChanged: (value) => debugPrint(value.completeNumber),
        )
      ],
    ),
  );
}

Widget passwordWidget(String title, TextEditingController textController) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: true,
            controller: textController,
            decoration: InputDecoration(
                hintText: title,
                border: InputBorder.none,
                fillColor: HexColor('#bebebe'),
                filled: true))
      ],
    ),
  );
}

Widget standartWidget(String title, TextEditingController textController) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        TextField(
            controller: textController,
            decoration: InputDecoration(
                hintText: title,
                border: InputBorder.none,
                fillColor: HexColor('#bebebe'),
                filled: true))
      ],
    ),
  );
}