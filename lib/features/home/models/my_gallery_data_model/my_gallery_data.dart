import 'data.dart';

class MyGalleryData {
  String? status;
  Data? data;
  String? message;

  MyGalleryData({this.status, this.data, this.message});

  factory MyGalleryData.fromJson(Map<String, dynamic> json) => MyGalleryData(
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
        'message': message,
      };
}
