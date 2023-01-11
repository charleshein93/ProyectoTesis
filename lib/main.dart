import 'package:flutter/material.dart';
import 'package:mapa01/ui/pages/routes/pages.dart';
import 'ui/pages/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mapa01/firebase_options.dart';

// void main() => runApp(const MyApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'TEST MAPA',
      initialRoute: Routes.SPLASH,
      routes: appRoutes(),
    );
  }
}
