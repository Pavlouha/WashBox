import 'package:flutter/material.dart';

import 'package:washbox/views/widgets/login_and_registration.dart';
import 'package:washbox/other/colors.dart';
import 'package:washbox/other/borders.dart';

import 'package:washbox/logic/blocs/auth/gender_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationView extends StatefulWidget {
  RegistrationView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nameController = TextEditingController();
  final _patronymicController = TextEditingController();
  final _surnameController = TextEditingController();

  final _genderController = TextEditingController();

  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  ///Проверка e-mail на корректность. Чтоб при загрузке страницы не краснело, ввёл
  ///второй бул - _isEmailRedacted
  bool _isEmailRedacted = false;
  bool _isEmailValid = true;

  ///Проверка электронной почты
  final RegExp _emailVaildator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  ///Кнопка регистрации
  Widget _submitButton() {
    //TODO OnPressed
    return TextButton(onPressed: null,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: buttonColor,
        ),
        child: Text(
          'Зарегистрироваться',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),);
  }

  ///Здесь видны все компоненты ТекстИнпут
  Widget _loginPasswordWidget() {
    return Column(
      children: <Widget>[
        numberWidget("Телефон*", _loginController),
        passwordWidget("Пароль*", _passwordController),
        SizedBox(height: 20),
        standartTextInputWidget("Фамилия*", _surnameController),
        standartTextInputWidget("Имя*", _nameController),
        standartTextInputWidget("Отчество*", _patronymicController),
        radioButtonGenderWidget("Укажите пол", _genderController),
        emailInputWidget("Ваш e-mail", _emailController),
        standartTextInputWidget("Адрес", _addressController),
      ],
    );
  }

  /// Собственно, сама страница
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        body: Container(
          color: backgroundColor,
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      title("Регистрация", context),
                      _loginPasswordWidget(),
                      SizedBox(height: 20),
                      _submitButton(),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  ///Убираем текстовые контроллеры
  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _genderController.dispose();
    _patronymicController.dispose();
    _surnameController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  ///Радиокнопки. Узнаём, какой гендер выбран, при необходимости - показываем дополнительное поле ввода
  Widget radioButtonGenderWidget(String title,
      TextEditingController textController) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: BlocBuilder<GenderBloc, GenderState>(
          builder : (context, state) {
           return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Пол*', style: TextStyle(color: inputTextColor, fontSize: 16),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        activeColor: activeRadioColor,
                        value: 0,
                        groupValue: state.choosedGender,
                        onChanged: (_) {
                          BlocProvider.of<GenderBloc>(context).add(GenderSetMale());
                        },
                      ),
                      Text(
                        'Мужской',
                        style: new TextStyle(
                            fontSize: 13.0, color: activeRadioColor),
                      ),
                      Radio(
                        activeColor: activeRadioColor,
                        value: 1,
                        groupValue: state.choosedGender,
                        onChanged: (_) {
                          BlocProvider.of<GenderBloc>(context).add(GenderSetFemale());
                        },
                      ),
                      Text(
                        'Женский',
                        style: new TextStyle(
                          color: activeRadioColor,
                          fontSize: 13.0,
                        ),
                      ),
                      Radio(
                        activeColor: activeRadioColor,
                        value: 2,
                        groupValue: state.choosedGender,
                        onChanged: (_) {
                          BlocProvider.of<GenderBloc>(context).add(GenderSetOther());
                        },
                      ),
                      Text(
                        'Другое',
                        style: new TextStyle(
                            fontSize: 13.0, color: activeRadioColor),
                      ),
                    ],
                  ),
            state.choosedGender == 2 ? standartTextInputWidget(title, textController) : Container(width: 0,height: 0),
                ]
           );
          }
        ),
        );
  }

  ///Ввод электронной почты, её проверка
  Widget emailInputWidget(String title, TextEditingController textController) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: (value) {
                setState(() {
                  _isEmailRedacted = true;
                  _isEmailValid = _emailVaildator.hasMatch(value);
                });
              },
              controller: textController,
              decoration: InputDecoration(
                  hintText: title,
                  enabledBorder: inputBorder(),
                  focusedBorder: inputBorder(),
                  fillColor: _isEmailRedacted == true && _isEmailValid == false
                      ? Colors.red
                      : inputTextColor,
                  filled: true))
        ],
      ),
    );
  }

}