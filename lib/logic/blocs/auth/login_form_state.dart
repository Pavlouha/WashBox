part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.phone = const Phone.pure(),
    this.password = const Password.pure(),
    this.name = const Name.pure(),
    this.middleName = const MiddleName.pure(),
    this.surname = const Surname.pure(),
    this.gender = 'Male',
    this.email = const Email.pure(),
    this.address = '',
    this.status = FormzStatus.pure,
    this.hidden = true,
});

  final Phone phone;
  final Password password;
  final Name name;
  final MiddleName middleName;
  final Surname surname;
  final String gender;
  final Email email;
  final String address;
  final FormzStatus status;
  final bool hidden;

  LoginFormState copyWith({
    Phone phone,
    Password password,
    Name name,
    MiddleName middleName,
    Surname surname,
    String gender,
    Email email,
    String address,
    FormzStatus status,
    bool hidden,
  }) {
    return LoginFormState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      name: name ?? this.name,
      middleName: middleName ?? this.middleName,
      surname: surname ?? this.surname,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      address: address ?? this.address,
      status: status ?? this.status,
      hidden: hidden ?? this.hidden,
    );
  }

  @override
  List<Object> get props => [phone, password, name, middleName, surname, gender, email, address, status, hidden];
}
