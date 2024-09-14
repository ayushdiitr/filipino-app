import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  ProfileText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? TextStyle(fontSize: 16),
    );
  }
}
