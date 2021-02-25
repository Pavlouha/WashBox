import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc() : super(GenderInitial('Male'));

  @override
  Stream<GenderState> mapEventToState(GenderEvent event) async* {

    if (event is GenderSetMale) {
      yield GenderIsMale();
    } else if (event is GenderSetFemale) {
      yield GenderIsFemale();
    } else if (event is GenderSetOther) {
      yield GenderIsOther();
    }

  }

  @override
  void onEvent(GenderEvent event) {
    super.onEvent(event);
    debugPrint(this.state.choosedGender.toString());
  }
}
