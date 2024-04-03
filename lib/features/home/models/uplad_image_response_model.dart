class UpladImageResponseModel {
  String? status;
  List<dynamic>? data;
  String? message;

  UpladImageResponseModel({this.status, this.data, this.message});

  factory UpladImageResponseModel.fromJson(Map<String, dynamic> json) {
    return UpladImageResponseModel(
      status: json['status'] as String?,
      data: json['data'] as List<dynamic>?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data,
        'message': message,
      };
}
