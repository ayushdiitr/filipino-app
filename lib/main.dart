import 'package:flutter/material.dart';
import 'package:testapp/route/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final RouteGenerator _router = RouteGenerator();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filipino App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        primaryColor: const Color(0xffCCCCCC),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/chat',
      onGenerateRoute: _router.routeGenerate,
    );
  }
}
