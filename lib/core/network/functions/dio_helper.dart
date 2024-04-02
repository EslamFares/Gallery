import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//# simple use
//? TODo: DioHelper.init(); ==> in main()

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        //TODo: add base url
        baseUrl: "https://food-api-omega.vercel.app/api/v1/",
        receiveDataWhenStatusError: true,
      ),
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
  }

  static Future<Response> getData(
      {required String url,
      required Map<String, dynamic> query,
      Map<String, String>? headers,
      String? contentType}) async {
    return await dio.get(url,
        queryParameters: query,
        options: Options(
            //ex=>  contentType: Headers.formUrlEncodedContentType,
            contentType: contentType ?? 'application/json',
            headers: headers, //{'Authorization': 'Bearer $token'}
            followRedirects: false,
            validateStatus: (state) {
              return state! < 500;
            }));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> query,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    // var formData = FormData.fromMap(query);
    return await dio.post(
      url,
      data: query,
      options: Options(
        contentType: contentType ?? 'application/json',
        headers: headers, //{'Authorization': 'Bearer $token'}
        followRedirects: false,
        validateStatus: (state) {
          return state! < 500;
        },
      ),
    );
  }
}
