import 'package:tractian_challenge/model/assets.dart';
import 'package:tractian_challenge/model/data.dart';

List<Assets> generateListAssets({required List<Data> dataList}) {
  List<Assets> assetsList = [];

  for (var element in dataList) {
    assetsList.add(element as Assets);
  }
  return assetsList;
}
