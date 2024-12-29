import 'package:flutter/material.dart';

class MatchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/BuddyFound.png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Centered 
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Card 1
                    Positioned(
                      //top: 50.51,
                       //left: 5.42,
                      child: Transform.rotate(
                        angle: 4 * 3.14159 / 180, 
                        child: Container(
                          // width: 150,
                          height: 220,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              'images/matching.png', 
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Card 2
                    Positioned(
                      // top: 143.63,
                      left: 150.04, 
                      child: Transform.rotate(
                        angle: -4 * 3.14159 / 180, 
                        child: Container(
                          // width: 150,
                          height: 220,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              'images/matching2.png', 
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Star Badge 
                    Positioned(
                      top: 185, 
                      left: 137,  
                      child: Container(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), 
                          child: Image.asset(
                            'images/star.png', 
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                // Title
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Congratulations",
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                // Subtitle
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "It’s A Match, Zee!!",
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                // Say Hello Button
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Say Hello! 👋🏻",
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F), // Primary 700
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 10),
                      
                      // Not Now Button
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 358,
                          height: 50,
                          //padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              "Not Now",
                              style: TextStyle(
                                fontFamily: 'NoirPro',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
