import 'package:equatable/equatable.dart';
part 'token.g.dart';

class Token extends Equatable{
  final String accessToken;
  final String refreshToken;

  const Token({this.accessToken, this.refreshToken});

  @override
  List<Object> get props => [accessToken, refreshToken];

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}