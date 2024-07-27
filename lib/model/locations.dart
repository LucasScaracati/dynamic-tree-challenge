import 'package:tractian_challenge/model/data.dart';

class Locations implements Data {
  @override
  String id = '';
  @override
  String name = '';
  String? parentId;

  @override
  Data toObject(Map<String, dynamic> dataList) {
    Locations locations = Locations();
    locations.id = dataList['id'];
    locations.name = dataList['name'];
    locations.parentId = dataList['parentId'];
    return locations;
  }

  @override
  Map<String, dynamic> toJson(Data data) {
    Locations locations = Locations();
    locations = data as Locations;

    Map<String, dynamic> jsonLocations = {
      "id": locations.id,
      "name": locations.name,
      "parentId": locations.parentId,
    };
    return jsonLocations;
  }
}
