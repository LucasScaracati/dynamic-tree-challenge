import 'package:http/http.dart';

abstract class GetDataInterface {
  Future<Response> getData(Uri url);
}
