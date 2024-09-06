import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/ui/screens/splash/genderScreen.dart';
import 'package:testapp/src/ui/screens/splash/main.dart';

class DrinkAndSmokeScreen extends StatefulWidget {
  @override
  _DrinkAndSmokeScreenState createState() => _DrinkAndSmokeScreenState();
}

class _DrinkAndSmokeScreenState extends State<DrinkAndSmokeScreen> {
  String selectedDrinkingOption = '';
  String selectedSmokingOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Slider at the top
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.0),
                        child: Center(
                          child: LinearProgressIndicator(
                            value: 0.7,
                            color: Colors.black,
                            backgroundColor: Color(0xFFEEEEEE),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Text "Let's talk about your"
                Text(
                  "Let's talk about your",
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.02,
                    color: Colors.black,
                  ),
                ),

                // Text "Lifestyle and habits"
                Text(
                  "Lifestyle and habits",
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 16),

                // Description Text
                Text(
                  "Choose your preferences to help us find matches that meet your lifestyle.",
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.04,
                    color: Color(0xFF3F4A61), // Secondary-600 color
                  ),
                ),

                const SizedBox(height: 16),

                // Drinking options
                Text(
                  "Drinking",
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                // Drinking options as selectable boxes
                Wrap(
                  spacing: 12.0, // Horizontal gap between options
                  runSpacing: 12.0, // Vertical gap between options
                  children: [
                    _buildSelectableOption("Always", selectedDrinkingOption,
                        (val) {
                      setState(() {
                        selectedDrinkingOption = val;
                      });
                    }),
                    _buildSelectableOption("Sometimes", selectedDrinkingOption,
                        (val) {
                      setState(() {
                        selectedDrinkingOption = val;
                      });
                    }),
                    _buildSelectableOption("Rarely", selectedDrinkingOption,
                        (val) {
                      setState(() {
                        selectedDrinkingOption = val;
                      });
                    }),
                    _buildSelectableOption("Never", selectedDrinkingOption,
                        (val) {
                      setState(() {
                        selectedDrinkingOption = val;
                      });
                    }),
                    _buildSelectableOption("I am sober", selectedDrinkingOption,
                        (val) {
                      setState(() {
                        selectedDrinkingOption = val;
                      });
                    }),
                  ],
                ),

                const SizedBox(height: 32),

                // Smoking options
                Text(
                  "Smoke",
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                // Smoking options as selectable boxes
                Wrap(
                  spacing: 12.0, // Horizontal gap between options
                  runSpacing: 12.0, // Vertical gap between options
                  children: [
                    _buildSelectableOption("Sometimes ", selectedSmokingOption,
                        (val) {
                      setState(() {
                        selectedSmokingOption = val;
                      });
                    }),
                    _buildSelectableOption("Always", selectedSmokingOption,
                        (val) {
                      setState(() {
                        selectedSmokingOption = val;
                      });
                    }),
                    _buildSelectableOption("Never", selectedSmokingOption,
                        (val) {
                      setState(() {
                        selectedSmokingOption = val;
                      });
                    }),
                    _buildSelectableOption(
                        "Trying to quit", selectedSmokingOption, (val) {
                      setState(() {
                        selectedSmokingOption = val;
                      });
                    }),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Genderscreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F1F1F), // Primary-700 color
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        textStyle: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 22 / 14,
                          letterSpacing: 0.04,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Next'),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: TextButton(
                      onPressed: () {
                        // Skip to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Genderscreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor:
                            const Color(0xFF1F1F1F), // Primary-700 color
                        textStyle: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 22 / 14,
                          letterSpacing: 0.04,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('Skip'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectableOption(
      String option, String selectedOption, Function(String) onSelect) {
    return GestureDetector(
      onTap: () => onSelect(option),
      child: Container(
        width: 160, // Adjust width based on screen size if needed
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedOption == option ? Colors.black : Colors.grey),
          // borderRadius: BorderRadius.circular(8.0),
          color: selectedOption == option ? Colors.black : Colors.white,
        ),
        child: Center(
          child: Text(
            option,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selectedOption == option ? Colors.white : Colors.black,
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
