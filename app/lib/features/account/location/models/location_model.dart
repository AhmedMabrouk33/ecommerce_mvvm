class LocationModel {
  final String id;
  String title;
  String buildingNo;
  String flatNo;
  String streetAddress;
  String city;
  String area;
  bool isMainAddress;

  LocationModel({
    required this.id,
    required this.title,
    required this.buildingNo,
    required this.flatNo,
    required this.streetAddress,
    required this.city,
    required this.area,
    required this.isMainAddress,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      title: json['title'],
      buildingNo: json['buildingNo'],
      flatNo: json['flatNo'],
      streetAddress: json['streetAddress'],
      city: json['city'],
      area: json['area'],
      isMainAddress: json['isMainAddress'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'buildingNo': buildingNo,
      'flatNo': flatNo,
      'streetAddress': streetAddress,
      'city': city,
      'area': area,
      'isMainAddress': isMainAddress,
    };
  }
}
