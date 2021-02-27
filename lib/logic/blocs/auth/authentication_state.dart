part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {

  final String status;

  const AuthenticationState(this.status);

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {

  AuthenticationInitial(String status) : super(status);

}

class AuthenticationLoading extends AuthenticationState {
  AuthenticationLoading({String status = 'Loading'}) : super(status);
}

class AuthenticationNotAuthenticated extends AuthenticationState {
  AuthenticationNotAuthenticated({String status = 'Not authenticated'}) : super(status);
  
}

class AuthenticationAuthenticated extends AuthenticationState {
  final Token token;

  AuthenticationAuthenticated({String status = 'Authenticated', @required this.token}) : super(status);

  @override
  List<Object> get props => [token];
}

class AuthenticationFailed extends AuthenticationState {

  AuthenticationFailed({String status = 'Authentication failed'}) : super(status);

  @override
  List<Object> get props => [status];
}

class UserRegistered extends AuthenticationState {
  UserRegistered({String status = 'User registered'}) : super(status);
}

class UserRegistrationFailed extends AuthenticationState {
  UserRegistrationFailed({String status = 'User registration failed'}) : super(status);

  @override
  List<Object> get props => [status];
}

class TokenProlonged extends AuthenticationState {
  final Token token;

  TokenProlonged({String status = 'Prolonged', @required this.token}) : super(status);

  @override
  List<Object> get props => [token];
}

class TokenProlongationFailed extends AuthenticationState {

  TokenProlongationFailed({String status = 'Prolongation failed'}) : super(status);

  @override
  List<Object> get props => [status];
}