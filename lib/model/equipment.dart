import 'package:tractian_challenge/model/assets.dart';
import 'package:tractian_challenge/model/locations.dart';

class Equipment {
  String id = '';
  String name = '';
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;
  String? gatewayId;
  bool isLocal = false;
  List<Equipment>? children = [];

  Equipment locationToEquipment(Locations location) {
    Equipment equipment = Equipment();

    equipment.id = location.id;
    equipment.name = location.name;
    equipment.parentId = location.parentId;
    equipment.isLocal = true;
    return equipment;
  }

  Equipment assetToEquipment(Assets asset) {
    Equipment equipment = Equipment();

    equipment.id = asset.id;
    equipment.name = asset.name;
    equipment.sensorId = asset.sensorId;
    equipment.sensorType = asset.sensorType;
    equipment.status = asset.status;
    equipment.gatewayId = asset.gatewayId;
    equipment.parentId = asset.parentId ?? asset.locationId;
    equipment.isLocal = false;

    return equipment;
  }
}
