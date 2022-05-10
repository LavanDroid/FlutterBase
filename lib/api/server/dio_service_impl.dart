// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';

import '../../base/app_base.dart';
import '../../constants/api_path.dart';
import '../exceptions/dio_exception.dart';
import 'api_interceptors.dart';
import 'dio_service.dart';

class DioServiceImpl implements DioService {
  late Dio dio;
  CancelToken cancelToken = CancelToken();

  @override
  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiPath.baseUrl,
        headers: getAuthorizationHeader(),
        connectTimeout: 60000, // 60 sec
        receiveTimeout: 60000,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );
    initializeInterceptor();
  }

  initializeInterceptor() {
    dio.interceptors.add(ApiInterceptors());
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    late dynamic headers = {
      HttpHeaders.userAgentHeader: 'dio',
      //'api': '1.0.0',
    };
    return headers;
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  //? *** Get method *** //
  @override
  Future<Response> getRequest(String apiPath,
      {Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await dio.get(
        apiPath,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw DioException.createDioError(e);
    }
    return response;
  }

  //? *** Post method *** //
  @override
  Future<Response> postRequest(String apiPath,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await dio.post(
        apiPath,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw DioException.createDioError(e);
    }
    return response;
  }

  //? *** Post method *** //
  @override
  Future<Response> sessionPostRequest(String apiPath,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await dio.post(
        apiPath,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      var code = e.response != null ? e.response!.statusCode : 0;
      if (code == 401) {
        AppBase appBase = AppBase();
        appBase.sessionTimedOut();
        throw DioException.createDioError(e);
      } else {
        throw DioException.createDioError(e);
      }
    }
    return response;
  }

  //? *** Put method *** //
  @override
  Future<Response> putRequest(String apiPath,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await dio.put(
        apiPath,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw DioException.createDioError(e);
    }
    return response;
  }

  //? *** Patch method *** //
  @override
  Future<Response> patchRequest(String apiPath,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await dio.patch(
        apiPath,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw DioException.createDioError(e);
    }
    return response;
  }

  //? *** Delete method *** //
  @override
  Future<Response> deleteRequest(String apiPath,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await dio.delete(
        apiPath,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw DioException.createDioError(e);
    }
    return response;
  }

  //? *** PostForm method *** //
  @override
  Future<Response> postFormRequest(String apiPath,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await dio.post(
        apiPath,
        data: FormData.fromMap(data),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw DioException.createDioError(e);
    }
    return response;
  }

  //? *** PostStream method *** //
  @override
  Future<Response> postStreamRequest(String apiPath,
      {dynamic data,
      int dataLength = 0,
      Map<String, dynamic>? queryParameters}) async {
    Response response;
    Options requestOptions = Options();
    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    try {
      response = await dio.post(
        apiPath,
        data: Stream.fromIterable(data.map((e) => [e])),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw DioException.createDioError(e);
    }
    return response;
  }
}
