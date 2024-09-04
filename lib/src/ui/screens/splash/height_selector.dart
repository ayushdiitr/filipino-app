import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/src/ui/screens/splash/location.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<HeightSelector> {
  String _selectedUnit = 'in';
  int _selectedIndex = 14; // Initial index for 5'0" (default)

  final List<String> _heightsInInches = List.generate(
    34,
    (index) {
      int feet = 4 + index ~/ 12;
      int inches = index % 12;
      return "$feet'$inches\"";
    },
  );

  final List<String> _heightsInCm = List.generate(
    34,
    (index) {
      int cm = 122 + index * 3; // Starting at around 4'0" = 122 cm
      return "$cm cm";
    },
  );

  List<String> get _currentHeights =>
      _selectedUnit == 'in' ? _heightsInInches : _heightsInCm;

  Future<void> submitDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final selectedHeight = _currentHeights[_selectedIndex];

    if (selectedHeight.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your height!')),
        );
      }
      return;
    }

    await prefs.setString('selectedHeight', selectedHeight);

    if (mounted) {
      final firstName = prefs.get('firstName');
      final lastName = prefs.get('lastName');
      final occ = prefs.get('occupation');
      final age = prefs.get('age');
      final userId = prefs.get('userId');
      final gender = prefs.get('gender');
      final email = prefs.get('email');
      final meetChoices = prefs.get('choices');
      final relationChoices = prefs.get('relationChoices');
      final height = prefs.get('selectedHeight');

      print(
          "firstname $firstName, $lastName, $occ, $age, $userId, $gender, $email, $meetChoices, $relationChoices, $height}");

      // Navigate to the next screen after saving data
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EnableLocationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 100.0), // Extra space to avoid overlapping
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    child: Center(
                      child: LinearProgressIndicator(
                        value: 1.0,
                        color: Colors.black,
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 32.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Select your ', // Default text style
                        style: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'height ',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text.rich(
                      TextSpan(
                        text:
                            "Choose your height to help us find matches that meet your preferences.",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 150, // Height of the scrollable area
                      child: Stack(
                        children: [
                          ListWheelScrollView.useDelegate(
                            itemExtent: 50,
                            diameterRatio: 2.0,
                            physics: const FixedExtentScrollPhysics(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) {
                                return Center(
                                  child: Text(
                                    _currentHeights[index],
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: _selectedIndex == index
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                );
                              },
                              childCount: _currentHeights.length,
                            ),
                          ),
                          // Top and Bottom borders for the selected item
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      width: 1.0, color: Colors.black),
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ToggleButtons(
                        isSelected: [
                          _selectedUnit == 'cm',
                          _selectedUnit == 'in'
                        ],
                        selectedColor: Colors.white,
                        fillColor: Colors.black,
                        color: const Color(0xFF8E8E8E),
                        onPressed: (int index) {
                          setState(() {
                            _selectedUnit = index == 0 ? 'cm' : 'in';
                          });
                        },
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: Text(
                              'cm',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: Text(
                              'in',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // The button is placed at the bottom of the screen.
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    submitDetails();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    side: const BorderSide(width: 1, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Submit'),
                    ],
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
