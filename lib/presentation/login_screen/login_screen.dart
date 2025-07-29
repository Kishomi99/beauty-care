import 'package:BeautyCare/core/constants/app_colors.dart';
import 'package:BeautyCare/core/constants/app_text_style.dart';
import 'package:BeautyCare/core/constants/image_constant.dart';
import 'package:BeautyCare/route/app_route.dart';
import 'package:BeautyCare/widget/custom_elevated_button.dart';
import 'package:BeautyCare/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: screenHeight * 0.3,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ImageConstant.ladyMakeup,
                            ),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        controller: controller.emailController,
                        textInputType: TextInputType.emailAddress,
                        hintText: 'email'.tr,
                        icon: Icons.email,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'val_email'.tr;
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'val_email2'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => CustomTextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.maskEnable.value ?? true,
                          textInputType: TextInputType.visiblePassword,
                          hintText: 'password'.tr,
                          suffix: IconButton(
                            icon: Icon(
                              color: AppColors.darkBg,
                              controller.maskEnable.value ?? true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              controller.maskEnable.value =
                                  !(controller.maskEnable.value ?? true);
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'val_password'.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomElevatedButton(
                        text: 'login'.tr,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.callLogin();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "dont_have_account".tr,
                            style: AppTextStyle.textButtonText.copyWith(
                              color: AppColors.darkBg,
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.createAccountScreen);
                                controller.clearValue();
                              },
                              child: Text(
                                "sign_up".tr,
                                style: AppTextStyle.textButtonText,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
