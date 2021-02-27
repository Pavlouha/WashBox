// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      login: json['login'] as String,
    password: json['password'] as String,
    surname: json['surname'] as String,
    name: json['name'] as String,
    middleName: json['middle_name'] as String,
    dayOfBirth: json['day_of_birth'] as String,
    isMale: json['is_male'] as bool,
    isFemale: json['is_female'] as bool,
    isOther: json['is_other'] as String,
      phoneNumber: json['phone_number'] as String,
    email: json['email'] as String,
    address: json['address'] as String
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.phoneNumber,
      'password': instance.password,
      'surname': instance.surname,
      'name': instance.name,
      'middle_name': instance.middleName,
      'day_of_birth': instance.dayOfBirth,
      'is_male': instance.isMale,
      'is_female': instance.isFemale,
      'is_other': instance.isOther,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'address' : instance.address
    };
