part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthenticationEvent {}

class Loading extends AuthenticationEvent {}

class UserAuthenticate extends AuthenticationEvent {
  final Auth auth;

  UserAuthenticate({@required this.auth});

  @override
  List<Object> get props => [auth];
}

class UserLoggedOut extends AuthenticationEvent {}

class UserRegister extends AuthenticationEvent {
  final User user;

  UserRegister({@required this.user});

  @override
  List<Object> get props => [user];
}

class TokenExpire extends AuthenticationEvent {
  final Token token;

  TokenExpire({@required this.token});

  @override
  List<Object> get props => [token];
}