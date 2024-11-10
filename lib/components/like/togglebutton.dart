import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonScreenState createState() => _ToggleButtonScreenState();
}

class _ToggleButtonScreenState extends State<ToggleButton> {
  bool _isFrameOne = true; // To track the selected button

  void _toggle() {
    setState(() {
      _isFrameOne = !_isFrameOne; // Toggle between the buttons
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Optional padding around the buttons
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align the buttons to the left
        children: [
          // "All" Button
          GestureDetector(
            onTap: () {
              setState(() {
                _isFrameOne = true; // "All" button is selected
              });
            },
            child: Container(
              width: 55, // Width for "All"
              height: 30, // Height for "All"
              margin: EdgeInsets.only(right: 8), // Gap of 8px between buttons (horizontal)
              decoration: BoxDecoration(
                color: _isFrameOne ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'All',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: _isFrameOne ? Colors.white : Colors.black,
                    height: 14.4 / 12,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
            ),
          ),
          //SizedBox(width: 8),

          // "Ideal Connections" Button
          GestureDetector(
            onTap: () {
              setState(() {
                _isFrameOne = false; // "Ideal Connections" button is selected
              });
            },
            child: Container(
              width: 141, // Width for "Ideal Connections"
              height: 30, // Height for "Ideal Connections"
              decoration: BoxDecoration(
                color: !_isFrameOne ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.grey.shade600,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Ideal Connections',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: !_isFrameOne ? Colors.white : Colors.black,
                    height: 14.4 / 12,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
