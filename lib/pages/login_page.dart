import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:washbox/views/login_view.dart';
import 'package:washbox/logic/blocs/auth/password_cubit.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: LoginView(),
    );
  }
}