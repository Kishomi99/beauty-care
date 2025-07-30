import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:beauty_care/core/constants/app_text_style.dart';
import 'package:beauty_care/presentation/home_screen/widget/store_card_widget.dart';
import 'package:beauty_care/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.goldGlow,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.goldGlow.withOpacity(0.7),
                                offset: const Offset(40, 0),
                                blurRadius: 30,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Text("find_your_style".tr,
                            style: AppTextStyle.buttonText.copyWith(
                              fontSize: 30,
                            )),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none_outlined,
                              color: Colors.white60, size: 30)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                controller: controller.searchController,
                hintText: 'search'.tr,
                filled: false,
                textStyle: AppTextStyle.hintText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                hintStyle: AppTextStyle.hintText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                borderDecoration: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
                prefix: const Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "nearby_stores".tr,
                style: AppTextStyle.buttonText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.stores.length,
                        itemBuilder: (context, index) {
                          return BeautyStoreCard(
                              store: controller.stores[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
