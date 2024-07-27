import 'package:tractian_challenge/model/data.dart';

abstract class DataServiceInterface {
  List<Data> returnTranslatedData({required String messageBody});
}
