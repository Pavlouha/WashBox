import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:washbox/view/widgets/login_and_registration.dart';

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
          'Зарегистрироваться',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),);
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Регистрация',
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
        numberWidget("Логин*", _loginController),
        passwordWidget("Пароль*", _passwordController),
        SizedBox(height: 20),
        standartWidget("Фамилия*", _surnameController),
        standartWidget("Имя*", _nameController),
        standartWidget("Отчество*", _patronymicController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
