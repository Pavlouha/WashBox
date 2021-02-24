import 'package:flutter/material.dart';
import 'package:washbox/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washbox/logic/blocs/observer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
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