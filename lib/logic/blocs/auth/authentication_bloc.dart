import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:washbox/logic/blocs/auth/login_form_bloc.dart';
import 'package:washbox/logic/models/api/auth.dart';
import 'package:washbox/logic/models/api/token.dart';
import 'package:washbox/logic/models/api/user.dart';
import 'package:washbox/logic/repositories/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/* Для работы плагина Secure Storage в AndroidManifest добавил две строки
android:allowBackup="false"
android:fullBackupContent="false"
Подробнее: https://pub.dev/packages/flutter_secure_storage
 */


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
 final AuthRepository _repository = AuthRepository();
 final FlutterSecureStorage _storage = FlutterSecureStorage();

 String id;

 Token token;

  AuthenticationBloc() : super(AuthenticationInitial("Initial"));

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    //TODO проверить
    if (event is AppLoaded) {
      id = await _storage.read(key: 'user_id');
      if (id != null) {
        token = Token(accessToken: await _storage.read(key: 'access_token'), refreshToken: await _storage.read(key: 'refresh_token'));
        yield AuthenticationAuthenticated(token: token);
      } else {
        yield AuthenticationInitial("Initial");
      }
    }else if (event is UserLoggedOut) {
      yield AuthenticationNotAuthenticated();
      } else if (event is Loading) {
      yield AuthenticationLoading();
    } else if (event is UserRegister) {
      yield AuthenticationLoading();
      int _registeredId = await _repository.fetchRegistration(event.user);
      if (_registeredId != null) {
        id = _registeredId.toString();
        await _storage.write(key: 'user_id', value: _registeredId.toString());
        LoginFormBloc().state.copyWith(status: FormzStatus.submissionSuccess);
        yield UserRegistered();
      } else {
        yield UserRegistrationFailed();
      }
    } else if (event is UserAuthenticate) {
      yield AuthenticationLoading();
      Token _token = await _repository.fetchAuthentication(event.auth);
      if (_token != null) {
        await _storage.write(key: 'access_token', value: _token.accessToken);
        await _storage.write(key: 'refresh_token', value: _token.refreshToken);
        token = _token;
        yield AuthenticationAuthenticated(token: token);
      } else {
        yield AuthenticationFailed();
      }
    } else if (event is TokenExpire) {
      yield AuthenticationLoading();
      Token _newToken = await _repository.fetchRefreshing(event.token);
      if (_newToken != null) {
        await _storage.write(key: 'access_token', value: _newToken.accessToken);
        await _storage.write(key: 'refresh_token', value: _newToken.refreshToken);
        token = _newToken;
        yield TokenProlonged(token: _newToken);
      } else {
        yield TokenProlongationFailed();
      }
    }
  }
}
