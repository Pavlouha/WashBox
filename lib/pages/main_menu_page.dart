import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washbox/views/main_menu_view.dart';
import 'package:washbox/logic/blocs/main_menu/main_menu_cubit.dart';

class MainMenuPage extends StatelessWidget {

  const MainMenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainMenuCubit(),
      child: MainMenuView(),
    );
  }
}