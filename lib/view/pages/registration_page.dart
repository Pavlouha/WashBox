import 'package:flutter/material.dart';

import 'package:washbox/view/widgets/login_and_registration.dart';
import 'package:washbox/other/colors.dart';

///Существует только два гендера! (с)
enum Genders { male, female, other }

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nameController = TextEditingController();
  final _patronymicController = TextEditingController();
  final _surnameController = TextEditingController();

  final _genderController = TextEditingController();

  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  ///Значение гендера по умолчанию
  Genders _choosedGender = Genders.male;

  ///Отображение поля ввода гендера
  bool _genderIsVisible = false;

  ///Проверка e-mail на корректность. Чтоб при загрузке страницы не краснело, ввёл
  ///второй бул - _isEmailRedacted
  bool _isEmailRedacted = false;
  bool _isEmailValid = true;

  ///Скрыт ли пароль
  bool _hiddenPassword = true;

  ///Проверка электронной почты
 final RegExp _emailVaildator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

 ///Кнопка регистрации
  Widget _submitButton() {
    //TODO OnPressed
    return TextButton(onPressed: null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
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
        _passwordWidget("Пароль*", _passwordController),
        SizedBox(height: 20),
        standartTextInputWidget("Фамилия*", _surnameController),
        standartTextInputWidget("Имя*", _nameController),
        standartTextInputWidget("Отчество*", _patronymicController),
        radioButtonGenderWidget(),
        hiddenTextInputWidget("Укажите пол", _genderController),
        emailInputWidget("Ваш e-mail", _emailController),
        standartTextInputWidget("Адрес", _addressController),
      ],
    );
  }

  /// Собственно, сама страница
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                    SizedBox(height: height * .3),
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
  Widget radioButtonGenderWidget() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    activeColor: activeRadioColor,
                    value: Genders.male,
                    groupValue: _choosedGender,
                    onChanged: (value) {
                      setState(() {
                        _choosedGender = value;
                        _genderIsVisible = false;
                      });
                    },
                  ),
                  new Text(
                    'М',
                    style: new TextStyle(fontSize: 16.0, color: activeRadioColor),
                  ),
                  new Radio(
                    activeColor: activeRadioColor,
                    value: Genders.female,
                    groupValue: _choosedGender,
                    onChanged: (value) {
                      setState(() {
                        _choosedGender = value;
                        _genderIsVisible = false;
                      });
                    },
                  ),
                  new Text(
                    'Ж',
                    style: new TextStyle(
                      color: activeRadioColor,
                      fontSize: 16.0,
                    ),
                  ),
                  new Radio(
                    activeColor: activeRadioColor,
                    value: Genders.other,
                    groupValue: _choosedGender,
                    onChanged: (value) {
                      setState(() {
                        _choosedGender = value;
                        _genderIsVisible = true;
                     //   debugPrint(_genderIsVisible.toString());
                      });
                    },
                  ),
                  new Text(
                    'Другой',
                    style: new TextStyle(fontSize: 16.0, color: activeRadioColor),
                  ),
                ],
              ),
            ]));
  }

  ///Скрытое поле для ввода собственного гендера
  Widget hiddenTextInputWidget(String title, TextEditingController textController) {
    if (_genderIsVisible) {
      return standartTextInputWidget(title, textController);
    }
    return Container(
      width: 0,
      height: 0,
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
                  border:  InputBorder.none,
                  fillColor: _isEmailRedacted == true && _isEmailValid == false ? Colors.red : inputTextColor,
                  filled: true))
        ],
      ),
    );
  }

  ///Поле ввода пароля
  Widget _passwordWidget(String title, TextEditingController textController) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: _hiddenPassword,
              controller: textController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: _hiddenPassword == true ? Icon(Icons.remove_red_eye_outlined, color: Colors.black) :
                    Icon(Icons.remove_red_eye, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        _hiddenPassword = !_hiddenPassword;
                      });
                    },
                  ),
                  hintText: title,
                  border: InputBorder.none,
                  fillColor: inputTextColor,
                  filled: true))
        ],
      ),
    );
  }
}