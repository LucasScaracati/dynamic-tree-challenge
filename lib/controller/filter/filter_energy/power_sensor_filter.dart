import 'package:tractian_challenge/controller/filter/filter_abstract.dart';
import 'package:tractian_challenge/model/equipment.dart';

class FilterEnergy implements FilterInterface {
  @override
  List<Equipment> filter({
    required List<Equipment> list,
    required Map<String, Equipment> items,
  }) {
    List<Equipment> childrens = list.where((element) => element.sensorType == 'energy').toList();
    List<Equipment> tree = [];

    while (true) {
      Map<String?, List<Equipment>> groupedChildren = {};

      for (var item in childrens) {
        if (item.parentId == null) {
          tree.add(item);
          continue;
        }

        var key = item.parentId;
        if (groupedChildren.containsKey(key)) {
          groupedChildren[key]!.add(item);
        } else {
          groupedChildren[key] = [item];
        }
      }

      for (var key in groupedChildren.keys) {
        var parent = items[key];

        if (parent != null) {
          parent.children = groupedChildren[key];
          tree.add(parent);
        }
      }

      childrens = tree;

      if (childrens.any((item) => item.parentId == null)) {
        break;
      }
    }

    return tree.where((item) => item.parentId == null).toList();
  }
}
