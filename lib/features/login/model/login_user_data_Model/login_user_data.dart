import 'user.dart';

class LoginUserDataModel {
  User? user;
  String? token;

  LoginUserDataModel({this.user, this.token});

  factory LoginUserDataModel.fromJson(Map<String, dynamic> json) =>
      LoginUserDataModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
      };
}
