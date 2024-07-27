import 'package:tractian_challenge/model/data.dart';

class Assets implements Data {
  @override
  String id = '';
  @override
  String name = '';
  String? locationId;
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;
  String? gatewayId;

  @override
  Data toObject(Map<String, dynamic> dataList) {
    Assets asset = Assets();
    asset.id = dataList['id'];
    asset.name = dataList['name'];
    asset.locationId = dataList['locationId'];
    asset.parentId = dataList['parentId'];
    asset.sensorId = dataList['sensorId'];
    asset.sensorType = dataList['sensorType'];
    asset.status = dataList['status'];
    asset.gatewayId = dataList['gatewayId'];

    return asset;
  }

  @override
  Map<String, dynamic> toJson(Data data) {
    Assets assets = Assets();
    assets = data as Assets;

    Map<String, dynamic> jsonAssets = {
      "gatewayId": assets.gatewayId,
      "id": assets.id,
      "locationId": assets.locationId,
      "name": assets.name,
      "parentId": assets.parentId,
      "sensorId": assets.sensorId,
      "sensorType": assets.sensorType,
      "status": assets.status,
    };
    return jsonAssets;
  }
}
