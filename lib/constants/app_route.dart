class AppRoutes {
  //* Singleton logic
  AppRoutes._privateConstructor();
  static final AppRoutes _instance = AppRoutes._privateConstructor();
  factory AppRoutes() {
    return _instance;
  }

  //* Pages Route *//
  static const String initial = '/'; //? Default set like this
  static const String home = '/home';
  static const String profile = '/profile';
}
