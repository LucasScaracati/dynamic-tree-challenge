abstract class Data {
  String id = '';
  String name = '';
  Data toObject(Map<String, dynamic> dataList);

  Map<String, dynamic> toJson(Data data);
}
