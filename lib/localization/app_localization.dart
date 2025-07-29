import 'package:get/get.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //logi and signup
          'email': 'Email',
          'password': 'Password',
          'login': 'Login',
          'val_email': 'Please enter your email',
          "val_email2": "Please enter a valid email address",
          'val_password': 'Please enter your password',
          "dont_have_account": "Don't have an account?",
          "sign_up": "Sign Up",
          'create_account': 'Create Account',
          'name': 'User Name',
          'phone': 'Phone Number',
          'confirm_password': 'Confirm Password',
          'val_confirm_password': 'Please confirm your password',
          'val_confirm_password2': "Passwords do not match",

          'hint_name': 'Enter your name',
          'hint_email': 'Enter your email',
          'hint_phone': 'Enter your phone number',
          'hint_password': 'Enter your password',
          'hint_confirm_password': "Enter your confirm password",
          'val_name': 'Please enter your name',
          'val_phone': 'Please enter your phone number',
          'val_phone2': 'Please enter a valid phone number',
          'val_password2': 'Password must be at least 6 characters',
        }
      };
}
