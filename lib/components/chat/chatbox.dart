import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 16), // Outer padding
        child: Container(
          height: 50, // Set the fixed height to 50 pixels
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFCACACA),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centers children vertically
            children: [
              // Expanded widget allows the TextField to take up the remaining space
              Expanded(
                child: TextField(
                  textAlign: TextAlign.left,
                  textAlignVertical:
                      TextAlignVertical.center, // Centers the text vertically
                  decoration: InputDecoration(
                    hintText: "Start Typing",
                    hintStyle: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                      color: Color(0xFF808080),
                    ),
                    border: InputBorder.none, // Removes the default border
                    isDense: true, // Reduces the height of the TextField
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16), // Adds horizontal padding
                  ),
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                    color: Colors.black,
                  ),
                ),
              ),
              // Icon aligned to the center vertically
              Padding(
                padding: const EdgeInsets.only(
                    right: 11), // Adds right padding to the icon
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 19,
                  color: Color(0xFF808080),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
