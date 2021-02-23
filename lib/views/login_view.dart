import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:washbox/other/colors.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:washbox/views/widgets/login_and_registration.dart';
import 'package:washbox/pages/registration_page.dart';


class LoginView extends StatefulWidget {
  LoginView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginView> {

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  ///Кнопка входа
  Widget _submitButton() {
    //TODO OnPressed
    return TextButton(onPressed: null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
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
    return  TextButton(
      onPressed: () =>
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegistrationPage())),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: buttonColor,
        ),
        child: Text(
          'Регистрация',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),);
  }

  ///Колонка для пролистывания страницы (на всякий пожарный). Содержит поля ввода
  Widget _loginPasswordWidget() {
    return Column(
      children: <Widget>[
        numberWidget("Телефон", _loginController),
        passwordWidget("Пароль", _passwordController),
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
                fontSize: 16,
                color: Colors.black,
              ),),
            )
        ),
        child: Container(
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
                      SizedBox(height: height * .2),
                      SizedBox(height: 30),
                      // title("Вход", context),
                      Image(image: AssetImage('assets/logo.png'), height: 150),
                      SizedBox(height: 30),
                      _loginPasswordWidget(),
                      SizedBox(height: 30),
                      _submitButton(),
                      _registerButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///Убираем текстовые контроллеры
  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
