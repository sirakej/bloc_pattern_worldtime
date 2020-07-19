import 'package:blocpatternworldtime/model/timeResponse.dart';
import 'package:rxdart/rxdart.dart';
import'package:blocpatternworldtime/persistence/api_repository.dart';

class TimeBloc {
  Repository _repository = Repository();

  final _timeFetcher = PublishSubject<TimeResponse>();

  Observable<TimeResponse> get time => _timeFetcher.stream;

  getData() async {
    TimeResponse timeResponse = await _repository.getData();
    _timeFetcher.sink.add(timeResponse);
  }


  dispose() {
    _timeFetcher.close();
  }

}
  final timeBloc = TimeBloc();

