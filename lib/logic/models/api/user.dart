import 'package:equatable/equatable.dart';
part 'user.g.dart';

class User extends Equatable{
  final String login;
  final String password;
  final String surname;
  final String name;
  final String middleName;
  final String dayOfBirth;
  final bool isMale;
  final bool isFemale;
  final String isOther;
  final String phoneNumber;
  final String email;
  final String address;

  const User({this.login, this.password, this.surname, this.name,
  this.middleName, this.dayOfBirth, this.isMale, this.isFemale, this.isOther, this.phoneNumber, this.email, this.address});

  @override
  List<Object> get props => [login, password, surname, name,
    middleName, dayOfBirth, isMale, isFemale, isOther, phoneNumber, email, address];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}