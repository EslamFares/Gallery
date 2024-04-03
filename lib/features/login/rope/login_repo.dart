import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/cash/getstorage_helper.dart';

import '../../../core/network/api/api_consumer.dart';
import '../../../core/network/api/endpoints.dart';
import '../model/login_user_data_Model/login_user_data.dart';

class LoginRepo {
  final ApiConsumer api;

  LoginRepo({required this.api});
  Future<Either<String, LoginUserDataModel>> signIn(
      {required String email, required String password}) async {
    try {
      final res = await api.post(
        path: EndPoint.login,
        data: {"email": email, "password": password},
      );
      final user = LoginUserDataModel.fromJson(res);
      GetStorageHelper.writeData("userToken", "${user.token}");
      GetStorageHelper.writeData("username", "${user.user!.name}");
      return Right(user);
    } on Error catch (e) {
      return Left(e.toString());
    }
  }
}
