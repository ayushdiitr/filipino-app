import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/ui/splash/emailScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Genderscreen extends StatefulWidget {
  const Genderscreen({super.key});

  @override
  _GenderInfoState createState() => _GenderInfoState();
}

class _GenderInfoState extends State<Genderscreen> {
  String? _selectedGender;

  // This method is used to handle the gender selection.
  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  // This method saves the selected gender to SharedPreferences.
  Future<void> saveGender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Validate that a gender is selected
    if (_selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your gender')),
      );
      return; // Stop further execution if validation fails
    }

    // Save the selected gender to SharedPreferences
    await prefs.setString('gender', _selectedGender!);
    // Navigate to the next screen after saving data
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Emailscreen()),
    );
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
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Center(
                      child: LinearProgressIndicator(
                        value: 0.7,
                        color: Colors.black,
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InputChip(
                          label: Text(
                            'BASIC INFO',
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              letterSpacing: 0.8,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          visualDensity:
                              VisualDensity(horizontal: -4.0, vertical: -4.0),
                          backgroundColor:
                              Colors.white, // White background color
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: Text.rich(
                            TextSpan(
                              text: 'Select your ', // Default text style
                              style: TextStyle(
                                fontFamily: 'NoirPro',
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Gender',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Baskerville',
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text.rich(
                          TextSpan(
                            text:
                                "We match daters using 3 broad gender groups.",
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ['Male', 'Female', 'Non Binary']
                              .map((String gender) {
                            bool isSelected = _selectedGender == gender;
                            return GestureDetector(
                              onTap: () => _selectGender(gender),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                padding: const EdgeInsets.all(16.0),
                                width: double
                                    .infinity, // Make each container take full width
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                ),
                                child: Text(
                                  gender,
                                  style: TextStyle(
                                    fontFamily: 'NoirPro',
                                    color:
                                        isSelected ? Colors.white : Colors.grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
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
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: _selectedGender != null ? saveGender : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedGender != null
                        ? Colors.black
                        : Color(0xFF8E8E8E),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                      ),
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
