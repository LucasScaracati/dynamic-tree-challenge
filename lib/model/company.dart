import 'package:tractian_challenge/model/data.dart';

class Company implements Data {
  @override
  String id = '';
  @override
  String name = '';

  @override
  Data toObject(Map<String, dynamic> dataList) {
    Company company = Company();
    company.id = dataList['id'];
    company.name = dataList['name'];

    return company;
  }

  @override
  Map<String, dynamic> toJson(Data data) {
    throw UnimplementedError();
  }
}
