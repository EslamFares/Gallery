import 'package:dio/dio.dart';
import 'package:gallery_app/core/network/api/api_consumer.dart';
import 'package:gallery_app/core/network/api/api_interceptor.dart';
import 'package:gallery_app/core/network/api/endpoints.dart';
import 'package:gallery_app/core/network/errors/handel_dio_exceptions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//ToDo: in main UserCubit(ApiService(dio: Dio())),
class ApiService extends ApiConsumer {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options = BaseOptions(
      //TODo: add base url
      baseUrl: EndPoint.baseUrl,
      receiveDataWhenStatusError: true,
    );
    //Simply add PrettyDioLogger to your dio interceptors.
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    //Bad print request & response in Dubgconsole but no package
    // dio.interceptors.add(LogInterceptor(request: true,requestHeader: true,requestBody: true,responseHeader: true, responseBody: true,error: true,));

    // to add option in (request ex=>headers) & error & respons but i add for every method a lone
    dio.interceptors.add(ApiInterceptor());
  }

  @override
  Future delete(
      {required String path,
      Map<String, dynamic>? query,
      dynamic data,
      bool isFormData = false,
      Map<String, String>? headers,
      String? contentType}) async {
    try {
      final response = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: query,
          options: Options(
              //ex=>  contentType: Headers.formUrlEncodedContentType,
              contentType: contentType ?? 'application/json',
              headers: headers //{'Authorization': 'Bearer $token'}
              ));
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }

  @override
  Future get(
      {required String path,
      Map<String, dynamic>? query,
      Object? data,
      Map<String, String>? headers,
      String? contentType}) async {
    try {
      final response = await dio.get(path,
          queryParameters: query,
          data: data,
          options: Options(
            //ex=>  contentType: Headers.formUrlEncodedContentType,
            contentType: contentType ?? 'application/json',
            headers: headers, //{'Authorization': 'Bearer $token'}
          ));
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }

  @override
  Future patch(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      dynamic data,
      bool isFormData = false,
      String? contentType}) async {
    try {
      final response = await dio.patch(path,
          queryParameters: query,
          data: isFormData ? FormData.fromMap(data) : data,
          options: Options(
            //ex=>  contentType: Headers.formUrlEncodedContentType,
            contentType: contentType ?? 'application/json',
            headers: headers, //{'Authorization': 'Bearer $token'}
          ));
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }

  @override
  Future post(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      dynamic data,
      bool isFormData = false,
      String? contentType}) async {
    try {
      final response = await dio.post(path,
          queryParameters: query,
          data: isFormData ? FormData.fromMap(data) : data,
          options: Options(
            //ex=>  contentType: Headers.formUrlEncodedContentType,
            contentType: contentType ?? 'application/json',
            headers: headers, //{'Authorization': 'Bearer $token'}
          ));
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }
}
//#=============== example ==============
// signUp() async {
//   emit(SignUpLoading());
//   try {
//     final res = await api.post(path: EndPoint.signUp, data: {});
//     emit(SignUpSuccess());
//   } on ServerException catch (e) {
//     emit(SignUpFailure(errorMsg: e.errorModel.errorMessage));
//   }
// }
