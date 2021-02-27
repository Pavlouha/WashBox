part of 'login_form_bloc.dart';

abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object> get props => [];
}

class PhoneChanged extends LoginFormEvent {
  const PhoneChanged({@required this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PhoneUnfocused extends LoginFormEvent {}

class PasswordChanged extends LoginFormEvent {
  const PasswordChanged({@required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends LoginFormEvent {}

class NameChanged extends LoginFormEvent {
  const NameChanged({@required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class NameUnfocused extends LoginFormEvent {}

class MiddleNameChanged extends LoginFormEvent {
  const MiddleNameChanged({@required this.middleName});

  final String middleName;

  @override
  List<Object> get props => [middleName];
}

class MiddleNameUnfocused extends LoginFormEvent {}

class SurnameChanged extends LoginFormEvent {
  const SurnameChanged({@required this.surname});

  final String surname;

  @override
  List<Object> get props => [surname];
}

class SurnameUnfocused extends LoginFormEvent {}

class GenderChanged extends LoginFormEvent {
  const GenderChanged({@required this.gender});

  final String gender;

  @override
  List<Object> get props => [gender];
}

class GenderUnfocused extends LoginFormEvent {}

class EmailChanged extends LoginFormEvent {
  const EmailChanged({@required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends LoginFormEvent {}

class AddressChanged extends LoginFormEvent {
  const AddressChanged({@required this.address});

  final String address;

  @override
  List<Object> get props => [address];
}

class AddressUnfocused extends LoginFormEvent {
  const AddressUnfocused({@required this.address});

  final String address;
}

class LoginFormSubmitted extends LoginFormEvent {}

class RegisterFormSubmitted extends LoginFormEvent {}

class VisibilityChanged extends LoginFormEvent {
  const VisibilityChanged({@required this.hidden});

  final bool hidden;
}

class DateOfBirthConfirmed extends LoginFormEvent {
  const DateOfBirthConfirmed({@required this.dateOfBirth});

  final String dateOfBirth;

  @override
  List<Object> get props => [dateOfBirth];
}