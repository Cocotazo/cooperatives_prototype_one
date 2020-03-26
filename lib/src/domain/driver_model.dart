import 'dart:convert';

import 'destination_models.dart';
import 'passenger_model.dart';
import 'vehicle_model.dart';

DriverModel driverModelFromJson(String str) => DriverModel.fromJson(json.decode(str));

String driverModelToJson(DriverModel data) => json.encode(data.toJson());

class DriverModel {
  String identification;
  String firstName;
  String lastName;
  VehicleModel vehicle;
  PassengersModel passengers;
  DestinationModel destination;

  DriverModel({
    this.identification,
    this.firstName,
    this.lastName,
    this.vehicle,
    this.passengers,
    this.destination,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
    identification: json["Identification"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    vehicle: VehicleModel.fromJson(json["vehicle"]),
    passengers: PassengersModel.fromJson(json["passengers"]),
    destination: DestinationModel.fromJson(json["destination"]),
  );

  Map<String, dynamic> toJson() => {
    "Identification": identification,
    "first_name": firstName,
    "last_name": lastName,
    "vehicle": vehicle.toJson(),
    "passengers": passengers.toJson(),
    "destination": destination.toJson(),
  };
}