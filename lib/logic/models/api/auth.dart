import 'package:equatable/equatable.dart';
part 'auth.g.dart';

//@JsonSerializable(nullable: false)
class Auth extends Equatable{
  final String login;
  final String password;

  const Auth({this.login, this.password});

  @override
  List<Object> get props => [login, password];

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}