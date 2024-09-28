import 'package:flutter/material.dart';
import 'package:testapp/src/ui/homepage/main.dart';
//import 'package:testapp/src/ui/screens/splash/talk_about.dart';
import 'package:testapp/src/ui/homepage/profile.dart';

void main() {
  runApp(MaterialApp(
    title: 'Filipino App',
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/second': (context) => ProfilePage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: ProfilePage(),
    );
  }
}
