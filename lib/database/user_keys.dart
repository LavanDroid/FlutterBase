class UserKeys {
  //* Singleton logic
  UserKeys._privateConstructor();
  static final UserKeys _instance = UserKeys._privateConstructor();
  factory UserKeys() {
    return _instance;
  }

  //* Login
  static const String isRememberMeBool = 'isRememberMeBool';

  //* Auth data
  static const String accessTokenStr = 'accessToken';
  static const String refreshTokenStr = 'refreshToken';
  static const String userLoggedInInt = 'userLoggedIn';

  //* Home
  static const String homeCardCountInt = 'homeCardCount';

  //* Profile
  static const String userModel = 'userModel';
}
