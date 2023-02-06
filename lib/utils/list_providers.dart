import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quickmath/view_models/results.dart';
import '../view_models/math_provider.dart';

List<SingleChildWidget> providers = [
ChangeNotifierProvider(create: (_) => MathGen()),
ChangeNotifierProvider(create: (_) => ResultNotifier()),
];
