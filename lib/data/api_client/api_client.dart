import 'package:BeautyCare/core/constants/api_end_points.dart';
import 'package:BeautyCare/core/utils/pref_utils.dart';
import 'package:BeautyCare/data/models/response_model/response_model.dart';
import 'package:BeautyCare/presentation/login_screen/model/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {}
  @override
  void onReady() {
    super.onReady();
    _initializeDio();
  }

  final Dio _dio = Dio(BaseOptions(
    headers: {
      "Accept": "application/json",
      'Content-type': 'application/json',
    },
    connectTimeout: Duration(seconds: 10),
    baseUrl: ApiEndPoints.baseUrl,
  ));
  void _initializeDio() {
    final token = Get.find<PrefUtils>().getToken();
  }

  Future login(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map<String, String> headers = const {},
      Map requestData = const {}}) async {
    try {
      final response = await _dio.post(
        ApiEndPoints.loginEndPoint,
        data: requestData,
      );
      if (response.statusCode == 200) {
        onSuccess!(LoginResponseModel.fromJson(response.data));
      }
    } catch (e) {
      onError!(e);
    }
  }

  Future createUser(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map<String, String> headers = const {},
      Map requestData = const {}}) async {
    try {
      final response = await _dio.post(
        ApiEndPoints.registerEndPoint,
        data: requestData,
      );
      if (response.statusCode == 201) {
        onSuccess!(ResponseModel.fromJson(response.data));
      }
    } catch (e) {
      onError!(e);
    }
  }
}
