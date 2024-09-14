import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50, // Set a fixed height for the row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First row with icon and text
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max, // To wrap content only
                      children: [
                        Icon(Icons.man, size: 24),
                        SizedBox(width: 8),
                        Text("Female", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),

                // Vertical divider
                VerticalDivider(
                  thickness: 1,
                  color: Color.fromRGBO(238, 238, 238, 1),
                ),

                // Second row with icon and text
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max, // To wrap content only
                      children: [
                        Icon(Icons.pin_drop, size: 24),
                        SizedBox(width: 8),
                        Text("India", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),

                // Vertical divider
                VerticalDivider(
                  thickness: 1,
                  color: Color.fromRGBO(238, 238, 238, 1),
                ),

                // Third row with icon and text
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max, // To wrap content only
                      children: [
                        Icon(Icons.cake, size: 24),
                        SizedBox(width: 8),
                        Text("20", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Color.fromRGBO(238, 238, 238, 1),
          ),
          SizedBox(height: 16),
          Text(
            "About Me",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
