import 'package:flutter/material.dart';

class IconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Asian Cupid',
          style: TextStyle(
            fontFamily: 'Baskerville',
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            letterSpacing: 0.02,
            decoration: TextDecoration.none,
            decorationColor: Colors.transparent,
          ),
        ),
        IconButton(
          icon: Icon(Icons.legend_toggle_rounded),
          onPressed: () {},
          padding: EdgeInsets.all(0),
          iconSize: 20,
          color: Colors.black,
        ),
      ],
    );
  }
}
