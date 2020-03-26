import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) => VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  String vehiclePlate;
  String vehicleCode;
  String vehicleType;
  int places;

  VehicleModel({
    this.vehiclePlate,
    this.vehicleCode,
    this.vehicleType,
    this.places,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
    vehiclePlate: json["vehicle_plate"],
    vehicleCode: json["vehicle_code"],
    vehicleType: json["vehicle_type"],
    places: json["places"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle_plate": vehiclePlate,
    "vehicle_code": vehicleCode,
    "vehicle_type": vehicleType,
    "places": places,
  };
}
