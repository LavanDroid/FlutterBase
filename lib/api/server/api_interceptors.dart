import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../base/app_extension.dart';
import '../../constants/api_path.dart';
import '../../database/user_keys.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String accessToken =
        (GetStorage('USER_STORAGE').read(UserKeys.accessTokenStr) ?? '');
    if (accessToken.isNotEmpty) {
      options.headers[ApiPath.authorizationHeader] =
          ApiPath.bearer + accessToken;
    }
    AppPrint.getStaticPrint(
      '\n',
    );
    AppPrint.getStaticPrint('*** onRequest Start ***', printType: 2);
    AppPrint.getStaticPrint('Method: ${options.method.toUpperCase()}',
        printType: 2);
    AppPrint.getStaticPrint('Url: ${options.baseUrl}${options.path}',
        printType: 2);
    AppPrint.getStaticPrint('Data: ${options.data}', printType: 2);
    AppPrint.getStaticPrint('QueryParameters: ${options.queryParameters}',
        printType: 2);

    AppPrint.getStaticPrint('Headers:', printType: 2);
    options.headers
        .forEach((k, v) => AppPrint.getStaticPrint('$k: $v', printType: 2));

    // AppPrint.getStaticPrint('queryParameters:', printType: 1);
    // options.queryParameters
    //     .forEach((k, v) => AppPrint.getStaticPrint('$k: $v', printType: 2));

    AppPrint.getStaticPrint('*** onRequest End ***', printType: 2);
    super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    AppPrint.getStaticPrint(
      '\n',
    );
    AppPrint.getStaticPrint('*** onResponse Start ***', printType: 3);
    AppPrint.getStaticPrint('StatusCode: ${response.statusCode}', printType: 3);
    AppPrint.getStaticPrint('${response.data}', printType: 3);
    AppPrint.getStaticPrint('*** onResponse End ***', printType: 3);
    AppPrint.getStaticPrint(
      '\n',
    );
    super.onResponse(response, handler);
  }
}
