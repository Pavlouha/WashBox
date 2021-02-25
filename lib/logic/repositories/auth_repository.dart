import 'package:washbox/logic/models/api/auth.dart';
import 'package:washbox/logic/models/api/token.dart';
import 'package:washbox/logic/models/api/user.dart';
import 'package:washbox/logic/providers/auth_provider.dart';

class AuthRepository {

  AuthenticationProvider _authenticationProvider = AuthenticationProvider();

  Future<bool> fetchRegistration(User user) => _authenticationProvider.register(user: user);

  Future<Token> fetchAuthentication(Auth auth) => _authenticationProvider.authenticate(auth: auth);

  Future<Token> fetchRefreshing(Token token) => _authenticationProvider.refresh(token: token);
}