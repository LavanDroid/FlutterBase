class AppKeys {
  //* Singleton logic
  AppKeys._privateConstructor();
  static final AppKeys _instance = AppKeys._privateConstructor();
  factory AppKeys() {
    return _instance;
  }

  static const String isDarkModeBool = 'isDarkModeBool';
  static const String isFirstTimeBool = 'isFirstTime';
}
