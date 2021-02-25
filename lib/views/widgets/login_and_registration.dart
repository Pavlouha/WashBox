import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:washbox/logic/blocs/auth/login_form_bloc.dart';
import 'package:washbox/logic/models/auth/phone_number_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:washbox/other/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:washbox/other/borders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Все виджеты здесь немного отличаются, но в целом схожи - это текстинпуты с
/// "косметикой"
/// Добавлена библиотека для выбора телефонов
Widget numberWidget(String title, FocusNode focusNode) {
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
          child: BlocBuilder<LoginFormBloc, LoginFormState>(
              builder: (context, state) {
                return IntlPhoneField(
                  initialValue: state.phone.value,
                  countryCodeTextColor: HexColor('#6c6d70'),
                  inputFormatters: [PhoneNumberFormatter()],
                  keyboardType: TextInputType.phone,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    errorText: state.phone.invalid ? 'Убедитесь, что телефон верен' : null,
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
                  onChanged: (value) {
                    String s = value.completeNumber.replaceAll(RegExp(r"( *\(*\)*)"), '');
                    context.read<LoginFormBloc>().add(PhoneChanged(phone: s));
                  },
                  textInputAction: TextInputAction.next,
                );
              },
        ),
        )],
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
        color: inputTextColor,
      ),
    ),);
}

///"стандартные" поля ввода
Widget nameTextInputWidget(String title, FocusNode focusNode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
      BlocBuilder<LoginFormBloc, LoginFormState>(
          builder: (context, state) {
            return TextFormField(
              initialValue: state.name.value,
                focusNode: focusNode,
                decoration: InputDecoration(
                    errorText: state.name.invalid ? 'Введите Ваше имя' : null,
                    hintText: title,
                    enabledBorder: inputBorder(),
                    focusedBorder: inputBorder(),
                    fillColor: inputTextColor,
                    filled: true),
                onChanged: (value) {
              context.read<LoginFormBloc>().add(NameChanged(name: value));
            },
            textInputAction: TextInputAction.next);
          }),
      ],
    ),
  );
}

Widget middleNameTextInputWidget(String title, FocusNode focusNode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        BlocBuilder<LoginFormBloc, LoginFormState>(
            builder: (context, state) {
              return TextFormField(
                  initialValue: state.middleName.value,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      errorText: state.middleName.invalid ? 'Введите Ваше Отчество' : null,
                      hintText: title,
                      enabledBorder: inputBorder(),
                      focusedBorder: inputBorder(),
                      fillColor: inputTextColor,
                      filled: true), onChanged: (value) {
                context.read<LoginFormBloc>().add(MiddleNameChanged(middleName: value));
              },
              textInputAction: TextInputAction.next);
            }),
      ],
    ),
  );
}

Widget surnameTextInputWidget(String title, FocusNode focusNode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        BlocBuilder<LoginFormBloc, LoginFormState>(
            builder: (context, state) {
              return TextFormField(
                  initialValue: state.surname.value,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      errorText: state.surname.invalid ? 'Введите Вашу фамилию' : null,
                      hintText: title,
                      enabledBorder: inputBorder(),
                      focusedBorder: inputBorder(),
                      fillColor: inputTextColor,
                      filled: true),
                  onChanged: (value) {
                    context.read<LoginFormBloc>().add(SurnameChanged(surname: value));
                  },);
            }),
      ],
    ),
  );
}

Widget emailTextInputWidget(String title, FocusNode focusNode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        BlocBuilder<LoginFormBloc, LoginFormState>(
            builder: (context, state) {
              return TextFormField(
                  initialValue: state.email.value,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      errorText: state.email.invalid ? 'Введите корректную почту' : null,
                      hintText: title,
                      enabledBorder: inputBorder(),
                      focusedBorder: inputBorder(),
                      fillColor: inputTextColor,
                      filled: true), onChanged: (value) {
                context.read<LoginFormBloc>().add(EmailChanged(email: value));
              },);
            }),
      ],
    ),
  );
}

Widget addressTextInputWidget(String title, FocusNode focusNode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        BlocBuilder<LoginFormBloc, LoginFormState>(
            builder: (context, state) {
              return TextFormField(
                  initialValue: state.address,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      hintText: title,
                      enabledBorder: inputBorder(),
                      focusedBorder: inputBorder(),
                      fillColor: inputTextColor,
                      filled: true),
                  onChanged: (value) {
                    context.read<LoginFormBloc>().add(AddressChanged(address: value));},
                  );
            }),
      ],
    ),
  );
}

Widget genderTextInputWidget(String title, FocusNode focusNode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        BlocBuilder<LoginFormBloc, LoginFormState>(
            builder: (context, state) {
              return TextFormField(
                initialValue: state.address,
                focusNode: focusNode,
                decoration: InputDecoration(
                    hintText: title,
                    enabledBorder: inputBorder(),
                    focusedBorder: inputBorder(),
                    fillColor: inputTextColor,
                    filled: true),
                onChanged: (value) {
              BlocProvider.of<LoginFormBloc>(context).add(GenderChanged(gender: value));});
            }),
      ],
    ),
  );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

Widget dateOfBirthTextInputWidget(String title) {
  TextEditingController _textEditingController = TextEditingController();
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        BlocBuilder<LoginFormBloc, LoginFormState>(
            builder: (context, state) {
              return TextFormField(
              //  enabled: false,
                controller: _textEditingController,
                focusNode: new AlwaysDisabledFocusNode(),
                decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(
                        Icons.calendar_today_rounded, color: Colors.black),
                      onPressed: () {
                        showDatePicker(context: context, initialDate: DateTime(2010, 1, 1),
                          firstDate: DateTime(1900, 1, 1), lastDate:  DateTime(2010, 1, 1),
                          initialDatePickerMode: DatePickerMode.year,
                          locale : const Locale("ru","RU"),
                        ).then((selectedDate) {
              _textEditingController
              ..text = 'Дата: ${selectedDate.toString().substring(0, 10)}'
              ..selection = TextSelection.fromPosition(TextPosition(
              offset: _textEditingController.text.length,
              affinity: TextAffinity.upstream));
                         if (selectedDate != null) {
                           BlocProvider.of<LoginFormBloc>(context).add(DateOfBirthConfirmed(dateOfBirth: selectedDate.toIso8601String()));
                         }
                        });
                      },
                    ),
                    hintText: title,
                    enabledBorder: inputBorder(),
                    focusedBorder: inputBorder(),
                    fillColor: inputTextColor,
                    filled: true),
              );
            }
            ),
      ],
    ),
  );
}