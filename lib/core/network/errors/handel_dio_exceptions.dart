import 'package:dio/dio.dart';
import 'package:gallery_app/core/network/errors/error_model.dart';
import 'package:gallery_app/core/network/errors/server_exceptions.dart';

void handelDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad request
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 404: //notfound
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 409: //cpfficient
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 422: //unprocessable Entity
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 504: //Bad request
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
