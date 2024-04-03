import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/core/cash/getstorage_helper.dart';
import 'package:gallery_app/core/network/errors/error_model.dart';

import '../../../core/network/api/api_consumer.dart';
import '../../../core/network/api/endpoints.dart';
import '../../../core/network/errors/server_exceptions.dart';
import '../model/login_user_data_Model/login_user_data.dart';

class LoginRepo {
  final ApiConsumer api;

  LoginRepo({required this.api});
  Future<Either<ErrorModel, LoginUserDataModel>> signIn(
      {required String email, required String password}) async {
    try {
      final res = await api.post(
        path: EndPoint.login,
        data: {"email": email, "password": password},
      );
      final user = LoginUserDataModel.fromJson(res);
      debugPrint('user: $user');
      // final decodedToken = JwtDecoder.decode(user.token!);
      GetStorageHelper.writeData("userToken", "${user.token}");
      GetStorageHelper.writeData("username", "${user.user!.name}");
      // GetStorageHelper.writeData("userId", "${decodedToken["id"]}");
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
