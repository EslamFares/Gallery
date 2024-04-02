class ErrorModel {
  int status;
  String errorMessage;
  List<dynamic>? error;

  ErrorModel({required this.status, required this.errorMessage, this.error});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        status: json['status'] as int,
        errorMessage: json['ErrorMessage'] as String,
        error: json['Error'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'ErrorMessage': errorMessage,
        'Error': error,
      };
}
