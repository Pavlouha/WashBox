import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    debugPrint('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}