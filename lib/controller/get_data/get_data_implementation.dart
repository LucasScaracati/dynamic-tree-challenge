import 'package:http/http.dart';
import 'package:tractian_challenge/controller/get_data/get_data_interface.dart';
import 'package:http/http.dart' as http;

class GetDataImplementation implements GetDataInterface {
  @override
  Future<Response> getData(Uri url) async {
    return await http.get(url);
  }
}
