import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/cash/getstorage_helper.dart';
import 'package:gallery_app/features/home/models/my_gallery_data_model/my_gallery_data.dart';

import '../../../core/network/api/api_consumer.dart';
import '../../../core/network/api/endpoints.dart';
import '../../../core/network/errors/error_model.dart';
import '../../../core/network/errors/server_exceptions.dart';

class HomeRepo {
  final ApiConsumer api;

  HomeRepo({required this.api});

  Future<Either<ErrorModel, MyGalleryData>> getMyGallery() async {
    try {
      final res = await api.get(path: EndPoint.getMyGallery, headers: {
        "Authorization": "Bearer ${GetStorageHelper.readData('userToken')}",
      });
      final myGallery = MyGalleryData.fromJson(res);
      return Right(myGallery);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
