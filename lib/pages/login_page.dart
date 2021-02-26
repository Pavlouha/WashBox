import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washbox/logic/blocs/auth/login_form_bloc.dart';
import 'package:washbox/logic/blocs/auth/authentication_bloc.dart';

import 'package:washbox/views/login_view.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(
        create: (_) => LoginFormBloc(),
    ),
      BlocProvider(
        create: (_) => AuthenticationBloc(),
      ),
    ], child: LoginView(),
    );

  }
}