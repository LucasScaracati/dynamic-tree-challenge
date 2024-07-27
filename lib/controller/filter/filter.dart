import 'package:tractian_challenge/controller/filter/filter_abstract.dart';
import 'package:tractian_challenge/model/assets.dart';
import 'package:tractian_challenge/model/locations.dart';
import 'package:tractian_challenge/model/equipment.dart';

class Filter {
  FilterInterface filterSearch;
  Filter(this.filterSearch);

  List<Equipment> getDataFiltered({
    required List<Locations> locationsList,
    required List<Assets> assetsList,
  }) {
    Map<String, Equipment> totalMap = {};
    List<Equipment> totalObject = [];

    for (var element in locationsList) {
      Equipment total = Equipment().locationToEquipment(element);
      totalMap[total.id] = total;
      totalObject.add(total);
    }
    for (var element in assetsList) {
      Equipment total = Equipment().assetToEquipment(element);
      totalMap[total.id] = total;
      totalObject.add(total);
    }

    return filterSearch.filter(list: totalObject, items: totalMap);
  }
}

class FilterText {
  FilterTextInterface filterSearch;
  String text;
  FilterText(this.filterSearch, this.text);

  List<Equipment> getDataFiltered({
    required List<Locations> locationsList,
    required List<Assets> assetsList,
  }) {
    Map<String, Equipment> equipmentsMap = {};
    List<Equipment> equipmentsList = [];

    for (var element in locationsList) {
      Equipment equipment = Equipment().locationToEquipment(element);
      equipmentsMap[equipment.id] = equipment;
      equipmentsList.add(equipment);
    }
    for (var element in assetsList) {
      Equipment total = Equipment().assetToEquipment(element);
      equipmentsMap[total.id] = total;
      equipmentsList.add(total);
    }

    return filterSearch.filter(list: equipmentsList, items: equipmentsMap, text: text);
  }
}
