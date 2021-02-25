import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(nullable: false)
class User extends Equatable{
  final String phoneNumber;
  final String password;
  final String surname;
  final String name;
  final String middleName;
  final String dayOfBirth;
  final bool isMale;
  final bool isFemale;
  final String isOther;
  final String email;

  const User({this.phoneNumber, this.password, this.surname, this.name,
  this.middleName, this.dayOfBirth, this.isMale, this.isFemale, this.isOther, this.email});

  @override
  List<Object> get props => [phoneNumber, password, surname, name,
    middleName, dayOfBirth, isMale, isFemale, isOther, email];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}