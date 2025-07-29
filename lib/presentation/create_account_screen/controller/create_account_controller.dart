import 'package:BeautyCare/core/utils/pref_utils.dart';
import 'package:BeautyCare/data/api_client/api_client.dart';
import 'package:BeautyCare/data/models/register_user_model.dart';
import 'package:BeautyCare/presentation/login_screen/model/login_model.dart';
import 'package:BeautyCare/presentation/login_screen/model/login_response_model.dart';
import 'package:BeautyCare/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxnBool maskEnable = RxnBool(true);
  RxnBool maskEnable2 = RxnBool(true);
  RxBool isLoading = false.obs;

  RxBool loged = false.obs;
  var token;
  var prefUtils;

  LoginModel loginModel = LoginModel();

  @override
  void onReady() async {
    super.onReady();
    // Additional initialization if needed
  }

  RegisterUserModel get registerUserModel {
    return RegisterUserModel(
      email: emailController.text,
      name: nameController.text,
      mobileNumber: phoneController.text,
      password: passwordController.text,
    );
  }

  Future<void> callCreateAccount() async {
    try {
      isLoading.value = true;
      await Get.put(ApiClient()).createUser(
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },
        requestData: registerUserModel.toJson(),
        onSuccess: onRegisterSuccess,
        onError: (error) {
          isLoading.value = false;
          Get.dialog(
            AlertDialog(
              title: Text('Error'),
              content: Text(error.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('OK'),
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

  void onRegisterSuccess(dynamic response) async {
    await PrefUtils.setLogged(true);

    Get.snackbar(
      'Success',
      'Registration successful',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.offAllNamed(AppRoute.loginScreen);
  }
}
