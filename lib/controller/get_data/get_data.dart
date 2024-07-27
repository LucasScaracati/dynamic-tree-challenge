import 'package:tractian_challenge/controller/get_data/get_data_interface.dart';

class GetData {
  GetDataInterface getDataImplementation;
  Future<dynamic> getData(Uri url) async => await getDataImplementation.getData(url);
  GetData(this.getDataImplementation);
}
