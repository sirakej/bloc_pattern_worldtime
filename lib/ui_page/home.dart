import 'package:blocpatternworldtime/bloc%20pattern/time_response.dart';
import 'package:blocpatternworldtime/model/dateTime_model.dart';
import 'package:blocpatternworldtime/model/timezone_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blocpatternworldtime/model/timeResponse.dart';
import 'dart:async';
import 'package:blocpatternworldtime/modules/clock_container.dart';
import 'package:blocpatternworldtime/modules/world_time_clock_hands.dart';
import 'dart:math' as math;
import 'colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
int selectedMenu =4;
class _HomeState extends State<Home> {
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => timeBloc.getData());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeBloc.getData();
    return StreamBuilder(
        stream:timeBloc.time,
        builder: (context, AsyncSnapshot<TimeResponse> snapshot) {
          if (snapshot.hasData) {
            return _buildTimeScreen(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        }
    );
  }
//  _buildWindInfo(data.date),
//  _buildTitle(data.time)

  Widget _buildTimeScreen(TimeResponse data) {

    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            _buildTitle(data.time),
          SizedBox(
            height: 80.0,
          ),
          Center(
            child: ClockContainer(
              child: WorldTimeClockHands(worldLocation: "Africa/Lagos",),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          _buildWindInfo(data.date),
        ]

    )
    );
  }



  Column _buildWindInfo(Datetime time) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(time.date.toString().substring(11,19),
                style: TextStyle(
                  fontSize: 25,
              ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _buildVerticalDivider() {
    return Container(
        height: 20, child: VerticalDivider(color: Colors.blueGrey));
  }

  Center _buildTitle(Timezone zone) {
    return Center(
      child: Text(
        "Time in " + zone.time.toString(),
        style: TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 40.0),
        textAlign: TextAlign.center,
      ),
    );
  }

}
