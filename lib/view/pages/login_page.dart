import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Widget _submitButton() {
    //TODO OnPressed
    return TextButton(onPressed: null,
      child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: HexColor('#33ad34'),
      ),
      child: Text(
        'Войти',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),);
  }

  Widget _registerButton() {
    return  TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegistrationPage())),
      child: Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: HexColor('##249ed5'),
      ),
      child: Text(
        'Регистрация',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),);
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Вход',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 42,
            fontWeight: FontWeight.w700,
            color: HexColor('#1c3157'),
          ),
    ),);
  }

  Widget _loginPasswordWidget() {
    return Column(
      children: <Widget>[
        numberWidget("Логин", _loginController),
        passwordWidget("Пароль", _passwordController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: DoubleBackToCloseApp(
    snackBar: const SnackBar(
    content: Text('Ещё раз нажмите "назад" для выхода'),
    ), child: Container(
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
                      _title(),
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

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
