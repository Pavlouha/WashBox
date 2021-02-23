import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:washbox/views/registration_view.dart';
import 'package:washbox/logic/blocs/auth/password_cubit.dart';

import 'package:washbox/logic/blocs/auth/gender_bloc.dart';

class RegistrationPage extends StatelessWidget {

  const RegistrationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasswordCubit>(
          create: (BuildContext context) => PasswordCubit(),
        ),
        BlocProvider<GenderBloc>(
          create: (BuildContext context) => GenderBloc(),
        ),
      ],
      child: RegistrationView(),
    );
  }
}