class Data {
  List<dynamic>? images;

  Data({this.images});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        images: json['images'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'images': images,
      };
}
