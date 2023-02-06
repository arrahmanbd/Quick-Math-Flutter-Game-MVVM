import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmath/utils/list_providers.dart';
import 'package:quickmath/utils/themes.dart';
import 'package:quickmath/views/home.dart';

import 'view_models/math_provider.dart';
import 'view_models/theme_provider.dart';
import 'views/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
         theme: darkTheme,
        home: HomePage(),
      ),
    );
  }
}
