import 'package:flutter/material.dart';
import 'package:washbox/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washbox/logic/blocs/observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WashBox',
      home: LoginPage(),
      );
  }
}