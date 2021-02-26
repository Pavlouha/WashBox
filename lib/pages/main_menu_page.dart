import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:washbox/views/registration_view.dart';

class MainMenuPage extends StatelessWidget {

  const MainMenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      ],
      child: RegistrationView(),
    );
  }
}