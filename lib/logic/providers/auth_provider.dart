import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:washbox/logic/models/api/auth.dart';
import 'package:washbox/logic/models/api/token.dart';
import 'package:washbox/logic/models/api/user.dart';

import '../connectionString.dart';

class SignUpFailure implements Exception {}

class RegisterFailure implements Exception {}

class RefreshFailure implements Exception {}

class AuthenticationProvider {

  final Dio _dio;

  AuthenticationProvider ({Dio dio}) : _dio = dio;

  Future<bool> register({@required User user}) async {
    try {
     var response = await _dio.post(connectionString()+'user', data: user.toJson(), options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }));
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
    try {
      var response = await _dio.post(connectionString()+'auth/login', data: auth.toJson(), options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }));
      if (response.statusCode == 200) {
        return Token.fromJson(response.data);
      } else {
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
        return Token.fromJson(response.data);
      } else {
        throw RefreshFailure();
      }
    } on Exception {
      throw RefreshFailure();
    }
  }
}