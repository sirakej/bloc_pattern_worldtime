class Datetime {
String _datetime;
String _offset;

  Datetime(parsedJson) {
    _datetime = parsedJson;
    _offset = parsedJson;

  }

  String get date => _datetime;

  set datetime(String value) {
    _datetime = "$value";
  }

String get off => _offset;

set offset(String value) {
  _offset = value;
}

}