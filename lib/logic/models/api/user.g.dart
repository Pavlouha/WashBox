// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    phoneNumber: json['phoneNumber'] as String,
    password: json['password'] as String,
    surname: json['surname'] as String,
    name: json['name'] as String,
    middleName: json['middleName'] as String,
    dayOfBirth: json['dayOfBirth'] as String,
    isMale: json['isMale'] as bool,
    isFemale: json['isFemale'] as bool,
    isOther: json['isOther'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'dayOfBirth': instance.dayOfBirth,
      'isMale': instance.isMale,
      'isFemale': instance.isFemale,
      'isOther': instance.isOther,
      'email': instance.email,
    };
