import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:washbox/logic/models/api/auth.dart';
import 'package:washbox/logic/models/api/token.dart';
import 'package:washbox/logic/models/api/user.dart';
import 'package:washbox/logic/repositories/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());
  AuthRepository _repository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppLoaded) {
      //TODO почитать про сохранение токенов
      yield AuthenticationInitial();
    } else if (event is Loading) {
      yield AuthenticationLoading();
    } else if (event is UserRegister) {
      if (await _repository.fetchRegistration(event.user) == true) {
        yield UserRegistered();
      } else {
        yield UserRegistrationFailed(message: 'User Registration Failed');
      }
    } else if (event is UserAuthenticate) {
      Token token = await _repository.fetchAuthentication(event.auth);
      if (token != null) {

      }
    }
  }
}
