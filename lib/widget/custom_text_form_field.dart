import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:beauty_care/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool isPassword;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final InputBorder? borderDecoration;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final Widget? suffix;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool? obscureText;
  final bool autoFocus;
  final String? lableText;
  final InputDecoration? customdecoration;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    this.onChanged,
    this.focusNode,
    this.validator,
    this.hintStyle,
    this.prefix,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.borderDecoration,
    this.prefixConstraints,
    this.suffixConstraints,
    this.suffix,
    this.textStyle,
    this.textInputAction,
    this.textInputType,
    this.maxLines,
    this.obscureText = false,
    this.autoFocus = false,
    this.lableText,
    this.customdecoration,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      decoration: customdecoration ?? decoration,
      focusNode: focusNode,
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      autofocus: autoFocus,
      style: textStyle ?? AppTextStyle.labelFormText,
      obscureText: obscureText!,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
    );
  }

  InputDecoration get decoration => InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyle.hintText,
        prefixIcon: prefix,
        labelText: lableText,
        labelStyle: AppTextStyle.labelFormText,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.only(top: 12, bottom: 12, left: 15),
        fillColor: fillColor ?? const Color.fromARGB(255, 245, 217, 64),
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.darkBg,
                width: 2,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.darkBg,
                width: 2,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.darkBg,
                width: 2,
              ),
            ),
        errorBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
      );
}
