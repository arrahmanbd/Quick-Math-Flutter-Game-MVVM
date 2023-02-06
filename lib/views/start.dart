import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmath/view_models/results.dart';
import 'package:quickmath/views/home.dart';

import '../view_models/math_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Quick Math'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Consumer<ResultNotifier>(
                      builder: (context, score, child) {
                    int scor = score.count;
                    return Text(
                      'Best Result: $scor',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    );
                  })),
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Consumer<MathGen>(
                      builder: (context, startit, child) {
                        return InkWell(
                          onTap: () {
                            startit.math();
                            startit.shuffler();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuickMath()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(25)),
                            width: 220,
                            height: 80,
                            child: Center(
                              child: Text(
                                'Start Brain Test',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
