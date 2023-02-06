import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
class CountTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 10,
      build: (BuildContext context, double time) => Text(time.toString(),style: TextStyle(fontSize: 48),),
      interval: Duration(milliseconds: 100),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }
}