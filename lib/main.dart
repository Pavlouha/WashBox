import 'package:flutter/material.dart';
import 'package:washbox/view/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WashBox',
      home: LoginPage(),
      );
  }
}