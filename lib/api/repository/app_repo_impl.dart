//? import 'package:get/get.dart' hide Response;
import 'dart:convert';

import 'package:get/get.dart';
import '../../constants/api_path.dart';
import '../../model/login_auth/auth_token_model.dart';
import '../server/dio_service.dart';
import '../server/dio_service_impl.dart';
import 'app_repo.dart';

class AppRepoImpl implements AppRepo {
  late DioService dioService;

  AppRepoImpl() {
    dioService = Get.find<DioServiceImpl>();
    dioService.init();
  }

  @override
  Future<AuthTokenResponse> getAuthToken(data) async {
    return await dioService
        .postRequest(ApiPath.login, data: jsonEncode(data))
        .then((response) =>
            AuthTokenResponse.fromJson(jsonDecode(response.data)));
  }
}
