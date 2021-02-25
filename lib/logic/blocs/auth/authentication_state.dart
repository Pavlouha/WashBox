part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationNotAuthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final Auth auth;

  AuthenticationAuthenticated({@required this.auth});

  @override
  List<Object> get props => [auth];
}

class AuthenticationFailed extends AuthenticationState {
  final String message;

  AuthenticationFailed({@required this.message});

  @override
  List<Object> get props => [message];
}

class UserRegistered extends AuthenticationState {}

class UserRegistrationFailed extends AuthenticationState {
  final String message;

  UserRegistrationFailed({@required this.message});

  @override
  List<Object> get props => [message];
}

class TokenExpired extends AuthenticationState {
  final Token token;

  TokenExpired({@required this.token});

  @override
  List<Object> get props => [token];
}

class TokenProlongationFailed extends AuthenticationState {
  final String message;

  TokenProlongationFailed({@required this.message});

  @override
  List<Object> get props => [message];
}