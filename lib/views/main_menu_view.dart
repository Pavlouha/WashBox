import 'package:flutter/material.dart';
import 'package:washbox/other/colors.dart';
import 'package:washbox/pages/qr_code_scanner_page.dart';

import 'package:washbox/logic/blocs/main_menu/main_menu_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenuView extends StatefulWidget {
  @override
  _MainMenuView createState() => _MainMenuView();
}

class _MainMenuView extends State<MainMenuView> {

  final List<Widget> _children = [Container(color: Colors.red,), QRCodeScannerPage(), Container(color: Colors.blue), Container(color: Colors.black)];

  Widget build(BuildContext context) {
    return BlocBuilder<MainMenuCubit, int>(
      builder: (context, state) => Scaffold(
        body: _children[state],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state,
          backgroundColor: buttonColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.6),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
           context.read<MainMenuCubit>().change(value);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Прачечные',
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              label: 'QR Код',
              icon: Icon(Icons.qr_code_scanner),
            ),
            BottomNavigationBarItem(
              label: 'Машины',
              icon: Icon(Icons.waves_sharp),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}