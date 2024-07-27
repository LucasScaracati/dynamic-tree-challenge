import 'package:tractian_challenge/model/equipment.dart';

abstract class FilterInterface {
  List<Equipment> filter({
    required List<Equipment> list,
    required Map<String, Equipment> items,
  });
}

abstract class FilterTextInterface {
  List<Equipment> filter({
    required List<Equipment> list,
    required Map<String, Equipment> items,
    required String text,
  });
}
