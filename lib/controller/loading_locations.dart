import 'package:http/http.dart';
import 'package:tractian_challenge/const.dart';
import 'package:tractian_challenge/controller/assets/list_assets_generate.dart';
import 'package:tractian_challenge/controller/filter/filter.dart';
import 'package:tractian_challenge/controller/filter/filter_abstract.dart';
import 'package:tractian_challenge/controller/get_data/get_data.dart';
import 'package:tractian_challenge/controller/get_data/get_data_implementation.dart';
import 'package:tractian_challenge/controller/join_lists.dart';
import 'package:tractian_challenge/controller/loading_assets.dart';
import 'package:tractian_challenge/controller/locations/list_locations_generate.dart';
import 'package:tractian_challenge/model/assets.dart';
import 'package:tractian_challenge/model/data.dart';
import 'package:tractian_challenge/model/locations.dart';
import 'package:tractian_challenge/model/equipment.dart';
import 'package:tractian_challenge/service/data_service/data_service.dart';
import 'package:tractian_challenge/service/data_service/data_service_implementation.dart';

Future<List<Data>> loadingLocations({required String companyId}) async {
  Response response = await GetData(GetDataImplementation()).getDataImplementation.getData(Uri.http(urlApi, '/companies/$companyId/locations'));
  List<Data> apiData = DataService(DataServiceImplementation(Locations())).returnTranslatedData(messageBody: response.body);
  return apiData;
}

Future<List<Equipment>> joinData({required String companyId}) async {
  List<Locations> locationsList = generateListLocations(dataList: await loadingLocations(companyId: companyId));
  List<Assets> assetsList = generateListAssets(dataList: await loadingAssets(companyId: companyId));
  return JoinList().joinLists(locationsList: locationsList, assetsList: assetsList);
}

Future<List<Equipment>> joinDataFilter({required String companyId, required FilterInterface filterType}) async {
  List<Locations> locationsList = generateListLocations(dataList: await loadingLocations(companyId: companyId));
  List<Assets> assetsList = generateListAssets(dataList: await loadingAssets(companyId: companyId));
  return Filter(filterType).getDataFiltered(locationsList: locationsList, assetsList: assetsList);
}

Future<List<Equipment>> joinDataTextFilter({required String companyId, required FilterTextInterface filterType, required String text}) async {
  text = text.trim();
  if (text.isEmpty) {
    return await joinData(companyId: companyId);
  }
  List<Locations> locationsList = generateListLocations(dataList: await loadingLocations(companyId: companyId));
  List<Assets> assetsList = generateListAssets(dataList: await loadingAssets(companyId: companyId));
  return FilterText(filterType, text).getDataFiltered(locationsList: locationsList, assetsList: assetsList);
}
