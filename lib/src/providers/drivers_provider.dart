import 'dart:convert';

import 'package:cooperatives_prototype_one/src/models/driver_model.dart';
import 'package:http/http.dart' as http;

class DriversProvider{

  final String _dbUrl = 'https://cooperatives-prototype.firebaseio.com/';


  Future<bool> registerDriver(DriverModel driver) async{
    final _driverUrl = '$_dbUrl/drivers/${driver.identification}.json';
    final answer = await http.post(_driverUrl, body: driverModelToJson(driver));
    final decodeData = json.decode(answer.body);
    print(decodeData);
    return true;
  }

  Future<bool> editDriver(DriverModel driver) async{
    final _driverUrl = '$_dbUrl/drivers/${driver.identification}.json';
    final answer = await http.put(_driverUrl, body: driverModelToJson(driver));
    final decodeData = json.decode(answer.body);
    print(decodeData);
    return true;
  }

  Future<List<DriverModel>> getDrivers() async{
    final _driverUrl = '$_dbUrl/drivers.json';
    final answer = await http.get(_driverUrl);
    final Map<String, dynamic> decodeData = json.decode(answer.body);
    final drivers = new List<DriverModel>();
    if(decodeData == null) return [];

    decodeData.forEach((identification, driver){
      final driverTemp = DriverModel.fromJson(driver);
      driverTemp.identification = identification;
      drivers.add(driverTemp);
    });
    print(drivers);
    return drivers;
  }

}