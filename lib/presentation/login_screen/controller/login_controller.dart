import 'package:beauty_care/core/utils/pref_utils.dart';
import 'package:beauty_care/data/api_client/api_client.dart';
import 'package:beauty_care/presentation/login_screen/model/login_model.dart';
import 'package:beauty_care/presentation/login_screen/model/login_response_model.dart';
import 'package:beauty_care/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxnBool maskEnable = RxnBool(true);
  RxBool isLoading = false.obs;

  LoginModel loginModel = LoginModel();

  Future<void> callLogin() async {
    loginModel = LoginModel(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    try {
      isLoading.value = true;
      await Get.put(ApiClient()).login(
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },
        requestData: loginModel.toJson(),
        onSuccess: (response) async {
          await onCreateLoginSuccess(response);
        },
        onError: (error) {
          isLoading.value = false;
          Get.dialog(
            AlertDialog(
              title: const Text('Error'),
              content: Text(error.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
      );
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future onCreateLoginSuccess(LoginResponseModel response) async {
    await PrefUtils.setToken(response.accessToken);
    await PrefUtils.setUserId(response.user.id);
    await PrefUtils.setLogged(true);
    // print("login success");
    Get.offAllNamed(AppRoute.homeScreen);
    clearValue();
  }

  void clearValue() {
    emailController.clear();
    passwordController.clear();
    maskEnable.value = true;
  }
}
