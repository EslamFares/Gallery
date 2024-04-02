abstract class ApiConsumer {
  Future<dynamic> get(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      Object? data,
      String? contentType});
  Future<dynamic> post(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      Object? data,
      bool isFormData = false,
      String? contentType});
  Future<dynamic> patch(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      Object? data,
      bool isFormData = false,
      String? contentType});
  Future<dynamic> delete(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      Object? data,
      bool isFormData = false,
      String? contentType});
}
