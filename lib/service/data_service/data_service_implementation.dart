import 'dart:convert';

import 'package:tractian_challenge/model/data.dart';
import 'package:tractian_challenge/service/data_service/data_service_interface.dart';

class DataServiceImplementation implements DataServiceInterface {
  Data objectType;

  @override
  List<Data> returnTranslatedData({required String messageBody}) {
    List<Map<String, dynamic>> jsonObject = [];
    List<Data> dataObject = [];
    messageBody = messageBody.replaceAll(RegExp(r'[\[\]]'), '');
    messageBody = messageBody.replaceAll('},{', '}|{');
    List<String> listResults = messageBody.split('|');

    jsonObject.addAll(_transformingStringInJson(listResults));
    dataObject.addAll(_transformingJsonInObject(jsonObject));

    return dataObject;
  }

  List<Map<String, dynamic>> _transformingStringInJson(List<String> listResults) {
    List<Map<String, dynamic>> jsonObject = [];
    for (var value in listResults) {
      jsonObject.add(jsonDecode(value));
    }
    return jsonObject;
  }

  List<Data> _transformingJsonInObject(List<Map<String, dynamic>> jsonObject) {
    List<Data> dataObject2 = [];
    for (var element in jsonObject) {
      dataObject2.add(objectType.toObject(element));
    }
    return dataObject2;
  }

  DataServiceImplementation(this.objectType);
}
