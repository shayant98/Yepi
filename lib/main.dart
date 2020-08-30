import 'package:flutter/material.dart';
import 'package:yepi/app/locator.dart';

import 'app/router.gr.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yepi',
      theme: ThemeData(backgroundColor: Color(0xFFEEE0CB)),
      initialRoute: Routes.homeView,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
