import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washbox/logic/blocs/auth/authentication_bloc.dart';

import 'package:washbox/views/registration_view.dart';

import 'package:washbox/logic/blocs/auth/gender_bloc.dart';
import 'package:washbox/logic/blocs/auth/login_form_bloc.dart';

class RegistrationPage extends StatelessWidget {

  const RegistrationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GenderBloc>(
          create: (BuildContext context) => GenderBloc(),
        ),
        BlocProvider<LoginFormBloc>(
          create: (BuildContext context) => LoginFormBloc(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
      ],
      child: RegistrationView(),
    );
  }
}