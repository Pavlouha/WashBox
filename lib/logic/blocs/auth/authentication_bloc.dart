import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:washbox/logic/blocs/auth/login_form_bloc.dart';
import 'package:washbox/logic/models/api/auth.dart';
import 'package:washbox/logic/models/api/token.dart';
import 'package:washbox/logic/models/api/user.dart';
import 'package:washbox/logic/repositories/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
 final AuthRepository _repository = AuthRepository();
  AuthenticationBloc() : super(AuthenticationInitial("Initial"));


  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppLoaded) {
      //TODO сохранить токен в защищённом хранилище
      yield AuthenticationInitial("Initial");
    }else if (event is UserLoggedOut) {
      yield AuthenticationNotAuthenticated();
      } else if (event is Loading) {
      yield AuthenticationLoading();
    } else if (event is UserRegister) {
      yield AuthenticationLoading();
      bool isRegistered = await _repository.fetchRegistration(event.user);
      if (isRegistered != null) {
        LoginFormBloc().state.copyWith(status: FormzStatus.submissionSuccess);
        yield UserRegistered();
      } else {
        yield UserRegistrationFailed();
      }
    } else if (event is UserAuthenticate) {
      yield AuthenticationLoading();
      Token token = await _repository.fetchAuthentication(event.auth);
      if (token != null) {
        yield AuthenticationAuthenticated(token: token);
      } else {
        yield AuthenticationFailed();
      }
    } else if (event is TokenExpire) {
      yield AuthenticationLoading();
      Token newToken = await _repository.fetchRefreshing(event.token);
      if (newToken != null) {
        yield TokenProlonged(token: newToken);
      } else {
        yield TokenProlongationFailed();
      }
    }
  }
}
