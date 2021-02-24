import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washbox/logic/blocs/auth/login_form_bloc.dart';

import 'package:washbox/views/login_view.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (_) => LoginFormBloc(),
        child: LoginView());
  }
}