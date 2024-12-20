import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        // backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        body: Container(
          child: Text('Onboarding'),
        ));
  }
}
