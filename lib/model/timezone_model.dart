class Timezone{
  String _timezone;


  Timezone(parsedJson) {
    _timezone = parsedJson;

  }

  String get time => _timezone;

  set timezone(String value) {
    _timezone = value;
  }

}