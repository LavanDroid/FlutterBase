class AppStrings {
  //* Singleton logic
  AppStrings._privateConstructor();
  static final AppStrings _instance = AppStrings._privateConstructor();
  factory AppStrings() {
    return _instance;
  }

  //* Application Title *//
  /// Android: it is used in Recent apps,
  /// iOS: it is used in App switcher or CFBundleDisplayName in Info.plist
  static const String applicationTitle = 'GetX Base';

  //* AppBar Title *//
  static const String appBarHome = 'Flutter GetX';
  static const String appBarLogin = 'Login';
  static const String appBarProfile = 'Profile';

  //* Hint message *//
  static const String hintEmail = 'Email address';

  //* Error Message *//
  static const String errorNetwork = 'No Internet';
  static const String errorNetworkMsg = 'Please check your internet connection';
  static const String errorEmailEmpty = 'Enter an email';
  static const String errorEmailValid = 'Enter a valid email';
  static const String errorPasswordEmpty = 'Enter a password';
  static const String errorPasswordValid = 'Enter a valid password';
  static const String errorMobileEmpty = 'Enter mobile number';
  static const String errorMobileValid = 'Enter a mobile number';

  //* Dialog message *//
  static const String diaExitMsg = 'Are you sure you want to exit?';
  static const String diaLogout = 'Logout';
  static const String diaBtnYes = 'Yes';
  static const String diaBtnCancel = 'Cancel';

  //* Button message *//
  static const String btnLogin = appBarLogin;

  //* Normal message *//
  static const String welcomeMessage = 'Welcome to GetX Base';
}
