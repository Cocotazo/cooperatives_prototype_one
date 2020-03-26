import 'dart:convert';

import 'package:cooperatives_prototype_one/src/domain/destination_models.dart';


PassengersModel passengerModelFromJson(String str) => PassengersModel.fromJson(json.decode(str));

String passengerModel(PassengersModel data) => json.encode(data.toJson());

class PassengersModel {
  String identification;
  String firstName;
  String lastName;
  DestinationModel destination;

  PassengersModel({
    this.identification,
    this.firstName,
    this.lastName,
    this.destination,
  });

  factory PassengersModel.fromJson(Map<String, dynamic> json) => PassengersModel(
    identification: json["Identification"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    destination: DestinationModel.fromJson(json["destination"]),
  );

  Map<String, dynamic> toJson() => {
    "Identification": identification,
    "first_name": firstName,
    "last_name": lastName,
    "destination": destination.toJson(),
  };
}