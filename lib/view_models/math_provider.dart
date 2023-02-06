import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';
import 'package:quickmath/view_models/results.dart';
import 'package:quickmath/widget/player.dart';
import 'package:xrandom/xrandom.dart';

Parser p = Parser();
final random = Xrandom();

class MathGen extends ChangeNotifier {
  String _res = 'Start';
  int _answer = 0;
  int _option1 = 0;
  int _option2 = 0;
  int _option3 = 0;
  List _shuffle = [0, 0, 0, 0];
  bool _correct = false;
  bool _timer = false;
  int _count = 0;
  int get count => _count;
  //getter
  String get res => _res;
  int get answer => _answer;
  int get option1 => _option1;
  int get option2 => _option2;
  int get option3 => _option3;
  List get shuffle => _shuffle;
  bool get correct => _correct;
  bool get timer => _timer;

  void math() {
    _timer = true;
    int _num2 = Random().nextInt(9);
    int _num1 = Random().nextInt(7) + _num2; //Number 2 must be smaller
    List _operators = ['+', '-', '*']..shuffle(random);
    String op3 = _operators[1];
    Expression exp = p.parse('$_num1 $op3 $_num2');
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    _answer = eval.toInt();
    _res = '$_num1 $op3 $_num2';
    _correct = false;
    options();
    assetsAudioPlayer.play();
    AutoPlay().play('timer');
    notifyListeners();
  }

  void options() {
    _option1 = _answer + 12;
    _option2 = _answer + 1;
    _option3 = _answer + 3;
    notifyListeners();
  }

  void shuffler() {
    _shuffle = [option1, option2, answer, option3]..shuffle(random);
    notifyListeners();
  }

  void checkAnswer(int option) {
    assetsAudioPlayer.stop();
    if (option == _answer) {
      _correct = true;
      AutoPlay().play('correct');
      math();
      shuffler();
     result();
    } else {
      _correct = false;
      AutoPlay().play('error');
      math();
      shuffler();
    }
    notifyListeners();
  }

  void result() {
    _count++;
    notifyListeners();
  }
}
