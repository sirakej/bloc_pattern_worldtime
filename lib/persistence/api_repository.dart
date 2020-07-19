import 'package:blocpatternworldtime/model/timeResponse.dart';

import 'api_provide.dart';

class Repository{
  ApiProvider appProvider = ApiProvider();
  Future<TimeResponse> getData() => appProvider.getData();
}