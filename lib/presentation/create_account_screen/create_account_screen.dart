import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:beauty_care/core/constants/app_text_style.dart';
import 'package:beauty_care/widget/custom_elevated_button.dart';
import 'package:beauty_care/widget/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/create_account_controller.dart';

class CreateAccountScreen extends GetWidget<CreateAccountController> {
  CreateAccountScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    //double screenWidth = mediaQuery.size.width;
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            Text('create_account'.tr,
                                style: AppTextStyle.buttonText.copyWith(
                                  fontSize: 25,
                                )),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        lableText('name'.tr),
                        CustomTextFormField(
                          controller: controller.nameController,
                          textInputType: TextInputType.name,
                          hintText: 'hint_name'.tr,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'val_name'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        lableText('email'.tr),
                        CustomTextFormField(
                          controller: controller.emailController,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'hint_email'.tr,
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
                        SizedBox(height: screenHeight * 0.02),
                        lableText('phone'.tr),
                        CustomTextFormField(
                          controller: controller.phoneController,
                          textInputType: TextInputType.phone,
                          hintText: 'hint_phone'.tr,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'val_phone'.tr;
                            }
                            if (!GetUtils.isPhoneNumber(value)) {
                              return 'val_phone2'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        lableText('password'.tr),
                        Obx(
                          () => CustomTextFormField(
                            controller: controller.passwordController,
                            isPassword: true,
                            hintText: 'hint_password'.tr,
                            obscureText: controller.maskEnable.value ?? true,
                            suffix: Obx(
                              () => IconButton(
                                icon: Icon(
                                  controller.maskEnable.value ?? true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  controller.maskEnable.value =
                                      !controller.maskEnable.value!;
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'val_password'.tr;
                              }
                              if (value.length < 6) {
                                return 'val_password2'.tr;
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        lableText('confirm_password'.tr),
                        Obx(
                          () => CustomTextFormField(
                            controller: controller.confirmPasswordController,
                            isPassword: true,
                            hintText: 'hint_confirm_password'.tr,
                            obscureText: controller.maskEnable2.value ?? true,
                            suffix: Obx(
                              () => IconButton(
                                icon: Icon(
                                  controller.maskEnable2.value ?? true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  controller.maskEnable2.value =
                                      !controller.maskEnable2.value!;
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'val_confirm_password'.tr;
                              }
                              if (value != controller.passwordController.text) {
                                return 'val_confirm_password2'.tr;
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        CustomElevatedButton(
                          text: 'create_account'.tr,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              controller.callCreateAccount();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row lableText(String lable) {
    return Row(
      children: [
        Text(
          lable,
          style: AppTextStyle.labelFormText,
        ),
        const SizedBox(width: 10),
        Text(
          "*".tr,
          style: AppTextStyle.labelFormText.copyWith(
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}
