import 'package:tractian_challenge/model/data.dart';
import 'package:tractian_challenge/model/locations.dart';

List<Locations> generateListLocations({required List<Data> dataList}) {
  List<Locations> locationsList = [];

  for (var element in dataList) {
    locationsList.add(element as Locations);
  }
  return locationsList;
}
