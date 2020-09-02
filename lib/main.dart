import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
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
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: Routes.startupView,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
