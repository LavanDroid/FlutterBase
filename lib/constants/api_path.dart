class ApiPath {
  //* Api headers
  static const String authorizationHeader = 'Authorization';
  static const String bearer = 'Bearer ';
  static const String acceptHeader = 'Accept';
  static const String versionKey = 'version';
  static const int apiVersion = 1;

  //* Api url path
  static const String baseUrl = 'http://65.2.76.175/api/';
  
  static const String apiGetBookPath =
      'https://gist.githubusercontent.com/JohannesMilke/d53fbbe9a1b7e7ca2645db13b995dc6f/raw/eace0e20f86cdde3352b2d92f699b6e9dedd8c70/books.json';
}
