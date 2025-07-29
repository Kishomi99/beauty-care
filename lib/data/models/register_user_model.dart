import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) =>
    RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) =>
    json.encode(data.toJson());

class RegisterUserModel {
  String name;
  String email;
  String password;
  String mobileNumber;

  RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.mobileNumber,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        mobileNumber: json["mobile_number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "mobile_number": mobileNumber,
      };
}
