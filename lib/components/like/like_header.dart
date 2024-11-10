import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LikeHeader(),
    );
  }
}

class LikeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ensure MediaQuery is valid by wrapping everything inside MaterialApp
    final paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Fixed height for the header
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: paddingTop), // Safe usage of MediaQuery
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Back button tapped");
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.zero,
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.zero,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                    ),
                    Container(
                      width: 92,
                      height: 21,
                      child: Text(
                        "Riya Bhist",
                        style: TextStyle(
                          fontFamily: 'Baskerville',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          letterSpacing: 0.02,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Three dots tapped");
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Container(
                            width: 4,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Color(0xFF1C1B1F),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content below header
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // You can now safely handle gestures after the layout is done
                    return Center(
                      child: Text('Content goes here'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(child: Text('Non-scrollable content goes here')),
    );
  }
}
