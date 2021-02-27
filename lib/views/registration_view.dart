import 'package:flutter/material.dart';
import 'package:washbox/logic/blocs/auth/authentication_bloc.dart';
import 'package:washbox/logic/models/api/user.dart';

import 'package:washbox/views/widgets/login_and_registration.dart';
import 'package:washbox/other/colors.dart';
import 'package:washbox/other/borders.dart';

import 'package:washbox/logic/blocs/auth/gender_bloc.dart';
import 'package:washbox/logic/blocs/auth/login_form_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:formz/formz.dart';

class RegistrationView extends StatefulWidget {
  RegistrationView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {

  final _loginFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _nameFocusNode = FocusNode();
  final _middleNameFocusNode = FocusNode();
  final _surnameFocusNode = FocusNode();

  final _genderFocusNode = FocusNode();

  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  ///Кнопка регистрации
  Widget _submitButton() {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
         return TextButton(onPressed: state.status.isValidated ? () {
           context.read<LoginFormBloc>().add(LoginFormSubmitted());
           User registerUser = User(phoneNumber: state.phone.value, password: state.password.value,
               surname: state.surname.value, name: state.name.value, middleName: state.middleName.value, dayOfBirth: state.dateOfBirth,
               isMale: state.gender=='Male'? true : false, isFemale: state.gender=='Female'? true : false,
               isOther: (state.gender != 'Male') && (state.gender != 'Female') ? state.gender : '', email: state.email.value);
           context.read<AuthenticationBloc>().add(UserRegister(user: registerUser));
         } : null,
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
    });
  }

  ///Здесь видны все компоненты ТекстИнпут
  Widget _loginPasswordWidget() {
    return Column(
      children: <Widget>[
        numberWidget("Телефон*", _loginFocusNode),
        passwordWidget("Пароль*", _passwordFocusNode),
        SizedBox(height: 20),
        surnameTextInputWidget("Фамилия*", _surnameFocusNode),
        nameTextInputWidget("Имя*", _nameFocusNode),
        middleNameTextInputWidget("Отчество*", _middleNameFocusNode),
        dateOfBirthTextInputWidget("Выберите дату рождения >"),
        radioButtonGenderWidget("Укажите пол", _genderFocusNode),
        emailTextInputWidget("Ваш e-mail", _emailFocusNode),
        addressTextInputWidget("Адрес", _addressFocusNode),
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
        body:
        Container(
          color: backgroundColor,
          height: height,
          child: Stack(
            children: <Widget>[
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state.status == 'Loading') {
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text('Подождите...')),
                      );
                  }
                  if (state.status == 'User registered') {
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text('Успех, авторизуйтесь, используя логин и пароль!')),
                      );
                    Future.delayed(const Duration(milliseconds: 2500), () {
                      Navigator.pop(context);
                    });
                  }
                  if (state.status == 'User registration failed') {
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text('Ошибка регистрации!')),
                      );
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pop(context);
                    });
                  }
                }, child: Container(
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
              ),),
            ],
          ),
        ));
  }

  ///Убираем текстовые ноды
  @override
  void dispose() {
    _loginFocusNode.dispose();
    _passwordFocusNode.dispose();
    _genderFocusNode.dispose();
    _middleNameFocusNode.dispose();
    _surnameFocusNode.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  ///Радиокнопки. Узнаём, какой гендер выбран, при необходимости - показываем дополнительное поле ввода
  Widget radioButtonGenderWidget(String title, FocusNode focusNode) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: BlocBuilder<GenderBloc, GenderState>(
          builder: (context, state) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Пол*',
                    style: TextStyle(color: inputTextColor, fontSize: 16),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        activeColor: activeRadioColor,
                        value: 'Male',
                        groupValue: state.choosedGender,
                        onChanged: (value) {
                          BlocProvider.of<GenderBloc>(context).add(
                              GenderSetMale());
                          BlocProvider.of<LoginFormBloc>(context).add(
                              GenderChanged(gender: value));
                        },
                      ),
                      Text(
                        'Мужской',
                        style: new TextStyle(
                            fontSize: 13.0, color: activeRadioColor),
                      ),
                      Radio(
                        activeColor: activeRadioColor,
                        value: 'Female',
                        groupValue: state.choosedGender,
                        onChanged: (value) {
                          BlocProvider.of<GenderBloc>(context).add(
                              GenderSetFemale());
                          BlocProvider.of<LoginFormBloc>(context).add(
                              GenderChanged(gender: value));
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
                        value: 'Other',
                        groupValue: state.choosedGender,
                        onChanged: (value) {
                          BlocProvider.of<GenderBloc>(context).add(
                              GenderSetOther());
                          BlocProvider.of<LoginFormBloc>(context).add(
                              GenderChanged(gender: value));
                        },
                      ),
                      Text(
                        'Другое',
                        style: new TextStyle(
                            fontSize: 13.0, color: activeRadioColor),
                      ),
                    ],
                  ),
                  state.choosedGender == 'Other' ? genderTextInputWidget(
                      title, focusNode) : Container(width: 0, height: 0),
                ]
            );
          }
      ),
    );
  }

  /// Виджет, содержащий местечко для ввода пароля. Нажатие на глаз переключает
  /// видимость пароля (звёздочки)
  Widget passwordWidget(String title, FocusNode focusNode) {
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
                initialValue: state.password.value,
                textInputAction: TextInputAction.done,
                obscureText: state.hidden,
                focusNode: focusNode,
                decoration: InputDecoration(
                    errorText: state.password.invalid
                        ? '8 символов, минимум 1 цифра'
                        : null,
                    suffixIcon: IconButton(
                      icon: state.hidden == true ? Icon(
                          Icons.remove_red_eye_outlined, color: Colors.black) :
                      Icon(Icons.remove_red_eye, color: Colors.black),
                      onPressed: () {
                        context.read<LoginFormBloc>().add(
                            VisibilityChanged(hidden: state.hidden));
                      },
                    ),
                    hintText: title,
                    enabledBorder: inputBorder(),
                    focusedBorder: inputBorder(),
                    fillColor: inputTextColor,
                    filled: true),
                onChanged: (value) {
                  context.read<LoginFormBloc>().add(
                      PasswordChanged(password: value));
                },);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loginFocusNode.addListener(() {
      if (!_loginFocusNode.hasFocus) {
        context.read<LoginFormBloc>().add(PhoneUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginFormBloc>().add(PasswordUnfocused());
      }
    });
    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        context.read<LoginFormBloc>().add(NameUnfocused());
      }
    });
    _middleNameFocusNode.addListener(() {
      if (!_middleNameFocusNode.hasFocus) {
        context.read<LoginFormBloc>().add(MiddleNameUnfocused());
      }
    });
    _surnameFocusNode.addListener(() {
      if (!_surnameFocusNode.hasFocus) {
        context.read<LoginFormBloc>().add(SurnameUnfocused());
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<LoginFormBloc>().add(EmailUnfocused());
      }
    });
  }

}