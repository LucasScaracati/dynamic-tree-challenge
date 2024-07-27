import 'package:tractian_challenge/model/data.dart';
import 'package:tractian_challenge/service/data_service/data_service_interface.dart';

class DataService {
  final DataServiceInterface _dataServiceInterface;
  DataService(this._dataServiceInterface);

  List<Data> returnTranslatedData({required String messageBody}) => _dataServiceInterface.returnTranslatedData(messageBody: messageBody);
}
