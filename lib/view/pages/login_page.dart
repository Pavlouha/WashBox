import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:washbox/other/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:washbox/view/widgets/login_and_registration.dart';

import 'package:washbox/view/pages/registration_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hiddenPassword = true;

  ///Кнопка входа
  Widget _submitButton() {
    //TODO OnPressed
    return TextButton(onPressed: null,
      child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: HexColor('#16850f'),
      ),
      child: Text(
        'Войти',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),);
  }

  ///Кнопка регистрации
  Widget _registerButton() {
    return  TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegistrationPage())),
      child: Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: buttonColor,
      ),
      child: Text(
        'Регистрация',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),);
  }

  /// Виджет, содержащий местечко для ввода пароля. Нажатие на глаз переключает
  /// видимость пароля (звёздочки)
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

///Колонка для пролистывания страницы (на всякий пожарный). Содержит поля ввода
  Widget _loginPasswordWidget() {
    return Column(
      children: <Widget>[
        numberWidget("Телефон", _loginController),
        _passwordWidget("Пароль", _passwordController),
      ],
    );
  }

  ///Построение страницы. Приложение обёрнуто в даблтап для предотвращения случайного выхода
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: DoubleBackToCloseApp(
    snackBar: SnackBar(backgroundColor: backgroundColor,
    content: Container(margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      child: Text('Ещё раз нажмите "назад" для выхода', style: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),),)
    ), child: Container(
          height: height,
          color: backgroundColor,
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
                      title("Вход", context),
                      _loginPasswordWidget(),
                      SizedBox(height: 50),
                      _submitButton(),
                      _registerButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ),);
  }

  ///Убираем текстовые контроллеры
  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
