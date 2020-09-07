import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/services/local_storage_service.dart';

import 'app/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  locator<LocalStorage>().getInstance();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yepi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Color(0xFFEEE0CB)),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: Routes.startupView,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
