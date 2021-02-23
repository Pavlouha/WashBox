import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:washbox/logic/phone_number_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:washbox/other/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:washbox/other/borders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washbox/logic/blocs/auth/password_cubit.dart';

///Все виджеты здесь немного отличаются, но в целом схожи - это текстинпуты с
/// "косметикой"
/// Добавлена библиотека для выбора телефонов
Widget numberWidget(String title, TextEditingController textController) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: inputTextColor,
          ),
          child: IntlPhoneField(
            countryCodeTextColor: HexColor('#6c6d70'),
            inputFormatters: [PhoneNumberFormatter()],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: title,
              fillColor: inputTextColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: inputTextColor),
                borderRadius: const BorderRadius.only(topRight :
                  const Radius.circular(10.0), bottomRight :
                const Radius.circular(10.0),
                ),),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: inputTextColor),
                borderRadius: const BorderRadius.only(topRight :
                const Radius.circular(10.0), bottomRight :
                const Radius.circular(10.0),
                ),),
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
                enabledBorder: inputBorder(),
                focusedBorder: inputBorder(),
                fillColor: inputTextColor,
                filled: true))
      ],
    ),
  );
}

/// Виджет, содержащий местечко для ввода пароля. Нажатие на глаз переключает
/// видимость пароля (звёздочки)
Widget passwordWidget(String title, TextEditingController textController) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        BlocBuilder<PasswordCubit, bool>(
          builder: (context, state) {
            return TextField(
                obscureText: state,
                controller: textController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: state == true ? Icon(Icons.remove_red_eye_outlined, color: Colors.black) :
                      Icon(Icons.remove_red_eye, color: Colors.black),
                      onPressed: () {
                        context.read<PasswordCubit>().change();
                      },
                    ),
                    hintText: title,
                    enabledBorder: inputBorder(),
                    focusedBorder: inputBorder(),
                    fillColor: inputTextColor,
                    filled: true));
          },
        ),
      ],
    ),
  );
}

