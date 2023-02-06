import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmath/view_models/math_provider.dart';
import 'package:quickmath/view_models/results.dart';
import 'package:quickmath/widget/timer.dart';
import 'package:quickmath/widget/option.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';

import '../view_models/theme_provider.dart';

class QuickMath extends StatelessWidget {
  final _controller = CountDownController();
  QuickMath({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MathGen>(
        builder: ((context, provider, child) => Container(
          color: Colors.green.withOpacity(.3),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: CountDownProgressIndicator(
                        controller: _controller,
                        valueColor: Colors.green,
                        backgroundColor: Colors.orange,
                        initialPosition: 0,
                        duration: 10,
                        text: 'SEC',
                        autostart: true,
                        onComplete: () => null,
                      ),
                    ),
                    Text(
                      provider.res,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 28,),
                    Container(
                      color: Colors.amber.withOpacity(.4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Result',
                            style: TextStyle(fontSize: 32,color: Colors.deepOrange),
                          ),
                          Text(
                            provider.count.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),

                    // Consumer<ResultNotifier>(
                    //     builder: ((context, provider, child) => Text(
                    //           provider.count.toString(),
                    //           style: Theme.of(context).textTheme.displayMedium,
                    //         ))),
                    Container(
                      color: Colors.blue.withOpacity(.2),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 28),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Option(0, _controller),
                                Option(1, _controller),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Option(2, _controller),
                                Option(3, _controller),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
          ),
        )),
      ),
    );
  }
}
