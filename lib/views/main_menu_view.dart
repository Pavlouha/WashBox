import 'package:flutter/material.dart';
import 'package:washbox/other/colors.dart';
import 'package:washbox/pages/qr_code_scanner_page.dart';

class MainMenuView extends StatefulWidget {
  @override
  _MainMenuView createState() => _MainMenuView();
}

class _MainMenuView extends State<MainMenuView> {

  int _currentIndex = 0;

  final List<Widget> _children = [Container(color: Colors.red,), QRCodeScannerPage(), Container(color: Colors.blue), Container(color: Colors.black)];

  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: buttonColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.6),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
         //TODO закинуть сюда кубит, прям-таки просится
          setState(() => _currentIndex = value);
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
    );
  }
}
