import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:washbox/logic/phone_number_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:washbox/other/colors.dart';
import 'package:hexcolor/hexcolor.dart';

///Все виджеты здесь немного отличаются, но в целом схожи - это текстинпуты с
/// "косметикой"
/// Добавлена библиотека для выбора телефонов
Widget numberWidget(String title, TextEditingController textController) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          color: inputTextColor,
          child: IntlPhoneField(
            countryCodeTextColor: HexColor('#6c6d70'),
            inputFormatters: [PhoneNumberFormatter()],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: title,
              fillColor: inputTextColor,
              filled: true,
              border: InputBorder.none,
            ),
            initialCountryCode: 'RU',
            controller: textController,
          ),
        ),
      ],
    ),
  );
}

///Заголовки
Widget title(String titleValue, BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: titleValue,
      style: GoogleFonts.portLligatSans(
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 42,
        fontWeight: FontWeight.w700,
       // color: HexColor('#1c3157'),
        color: inputTextColor,
      ),
    ),);
}

///"стандартное" поле ввода
Widget standartTextInputWidget(String title, TextEditingController textController) {
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
                fillColor: inputTextColor,
                filled: true))
      ],
    ),
  );
}

