import 'package:http/http.dart';
import 'package:tractian_challenge/const.dart';
import 'package:tractian_challenge/controller/get_data/get_data.dart';
import 'package:tractian_challenge/controller/get_data/get_data_implementation.dart';
import 'package:tractian_challenge/model/company.dart';
import 'package:tractian_challenge/model/data.dart';
import 'package:tractian_challenge/service/data_service/data_service.dart';
import 'package:tractian_challenge/service/data_service/data_service_implementation.dart';

Future<List<Data>> loadingHomePage() async {
  Response response = await GetData(GetDataImplementation()).getDataImplementation.getData(Uri.http(urlApi, '/companies'));
  List<Data> apiData = DataService(DataServiceImplementation(Company())).returnTranslatedData(messageBody: response.body);
  return apiData;
}
