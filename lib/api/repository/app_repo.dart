

import '../../model/login_auth/auth_token_model.dart';

abstract class AppRepo {
  Future<AuthTokenResponse> getAuthToken(data);
}
