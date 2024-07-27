import 'package:tractian_challenge/model/assets.dart';
import 'package:tractian_challenge/model/locations.dart';
import 'package:tractian_challenge/model/equipment.dart';

class JoinList {
  List<Equipment> joinLists({required List<Locations> locationsList, required List<Assets> assetsList}) {
    Map<String, Equipment> equipmentMap = {};
    List<Equipment> equipmentList = [];
    List<Equipment> equipmentFilteredList = [];

    for (var element in locationsList) {
      Equipment equipment = Equipment().locationToEquipment(element);
      equipmentMap[equipment.id] = equipment;
      equipmentList.add(equipment);
    }
    for (var element in assetsList) {
      Equipment total = Equipment().assetToEquipment(element);
      equipmentMap[total.id] = total;
      equipmentList.add(total);
    }
    equipmentFilteredList.addAll(equipmentList.where((element) => element.parentId == null));

    return searchOnChildren(totalMap: equipmentMap, totalObjectFiltrado: equipmentFilteredList);
  }

  List<Equipment> searchOnChildren({required Map<String, Equipment> totalMap, required List<Equipment> totalObjectFiltrado}) {
    for (var i = 0; i < totalObjectFiltrado.length; i++) {
      List<Equipment> children = [];

      for (var entry in totalMap.entries) {
        if (entry.value.parentId == totalObjectFiltrado[i].id) {
          children.add(entry.value);
        }
      }

      totalObjectFiltrado[i].children!.addAll(searchOnChildren(totalMap: totalMap, totalObjectFiltrado: children));
    }

    return totalObjectFiltrado;
  }
}
