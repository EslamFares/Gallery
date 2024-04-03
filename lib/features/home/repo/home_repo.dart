import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gallery_app/core/cash/getstorage_helper.dart';
import 'package:gallery_app/features/home/models/my_gallery_data_model/my_gallery_data.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<Either<String, String>> uplaodImagToServer(
      {required XFile image}) async {
    try {
      String filename = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(image.path,
            filename: filename, contentType: MediaType('image', 'png')),
      });

      // ignore: unused_local_variable
      final res = await api.post(
        path: EndPoint.uplaodImg,
        headers: {
          "Authorization": "Bearer ${GetStorageHelper.readData('userToken')}",
          "Connection": "keep-alive",
          "Accept": "*/*",
          "Accept-Encoding": "gzip, deflate, br",
          "Content-Type": "multipart/form-data;"
        },
        data: formData,
        responseType: ResponseType.plain,
      );

      return const Right("Image uploaded successfully");
    } on ServerException catch (e) {
      return Left(e.toString());
    }
  }
}
