import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:washbox/logic/models/api/auth.dart';
import 'package:washbox/logic/models/api/token.dart';
import 'package:washbox/logic/models/api/user.dart';

import 'package:flutter/foundation.dart';

import '../connectionString.dart';

class SignUpFailure implements Exception {}

class RegisterFailure implements Exception {}

class RefreshFailure implements Exception {}

class AuthenticationProvider {

  final Dio _dio = Dio();

  Future<bool> register({@required User user}) async {
    var formData = {
      "phone_number": user.phoneNumber,
      "password": user.password,
      "surname": user.surname,
      "name": user.name,
      "middle_name": user.middleName,
      "day_of_birth": user.dayOfBirth,
      "is_male": user.isMale,
      "is_female": user.isFemale,
      "is_other": user.isOther,
      "email": user.email
    };
    debugPrint('User ' + user.toString());
    try {
     var response = await _dio.post(connectionString()+'user', data: jsonEncode(formData), options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }));
     debugPrint('Response Data: '+ response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw RegisterFailure();
      }
    } on Exception {
      throw RegisterFailure();
    }
  }

  Future<Token> authenticate({@required Auth auth}) async {
    var formData = {
      "login": auth.login,
      "password": auth.password,
    };
    try {
      var response = await _dio.post(connectionString()+'auth/login', data: jsonEncode(formData), options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }));

      if (response.statusCode == 200) {
        return Token(accessToken: response.headers.value('Access_token'), refreshToken: response.headers.value('Refresh_token'));
      } else {
        debugPrint(response.headers.toString());
        throw SignUpFailure();
      }
    } on Exception {
      throw SignUpFailure();
    }
  }

  Future<Token> refresh({@required Token token}) async {
    try {
      var response = await _dio.post(connectionString()+'/auth/refresh', options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json", 'refresh_token' : token.refreshToken}));
      if (response.statusCode == 200) {
        return Token(accessToken: response.headers.value('Access_token'), refreshToken: response.headers.value('Refresh_token'));
      } else {
        throw RefreshFailure();
      }
    } on Exception {
      throw RefreshFailure();
    }
  }
}