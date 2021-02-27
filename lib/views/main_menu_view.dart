import 'package:flutter/material.dart';
import 'package:washbox/other/colors.dart';

class MainMenuView extends StatefulWidget {
  @override
  _MainMenuView createState() => _MainMenuView();
}

class _MainMenuView extends State<MainMenuView> {

  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: buttonColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.6),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
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
