import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/math_provider.dart';

class Option extends StatelessWidget {
  final int opt;
  final CountDownController cont;
  Option(@required this.opt, @required this.cont);

  @override
  Widget build(BuildContext context) {
    return Consumer<MathGen>(
      builder: ((context, provider, child) => InkWell(
            onTap: (() {
              provider.checkAnswer(provider.shuffle[opt]);
              cont.restart(initialPosition: 0);
              print('restarted 0');
            }),
            child: Text(
              provider.shuffle[opt].toString(),
              style: TextStyle(
                  fontSize: 32,
                  color: provider.correct ? Colors.green : Colors.blue),
            ),
          )),
    );
  }
}
