import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  const CardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          left: 0,
          right: 0,
          bottom: 0,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50, // Set a fixed height for the row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First row with icon and text
                  Expanded(
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // To wrap content only
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // To wrap content only
                      children: [
                        Icon(Icons.man, size: 24),
                        SizedBox(width: 8),
                        Text("Female",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'NoirPro')),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),

                  // Second row with icon and text
                  Expanded(
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // To wrap content only
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // To wrap content only
                      children: [
                        Icon(Icons.pin_drop_outlined, size: 24),
                        SizedBox(width: 8),
                        Text("India",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'NoirPro')),
                      ],
                    ),
                  ),
                  // Vertical divider
                  VerticalDivider(
                    thickness: 1,
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cake_outlined, size: 24),
                        SizedBox(width: 8),
                        Text("20",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'NoirPro')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Color.fromRGBO(238, 238, 238, 1),
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
