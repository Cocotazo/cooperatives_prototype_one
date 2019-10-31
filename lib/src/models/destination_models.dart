import 'dart:convert';

DestinationModel destinationModelFromJson(String str) => DestinationModel.fromJson(json.decode(str));

String destinationModelToJson(DestinationModel data) => json.encode(data.toJson());


class DestinationModel {
  int id;
  String city;
  String department;

  DestinationModel({
    this.id,
    this.city,
    this.department,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) => DestinationModel(
    id: json["id"],
    city: json["city"],
    department: json["department"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city": city,
    "department": department,
  };
}
