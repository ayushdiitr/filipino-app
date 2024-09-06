import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/ui/screens/splash/emailScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
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
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    child: Center(
                      child: LinearProgressIndicator(
                        value: 0.7,
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
                            text: 'Gender',
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
                        text: "We match daters using 3 broad gender groups.",
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          ['Male', 'Female', 'Non Binary'].map((String gender) {
                        bool isSelected = _selectedGender == gender;
                        return GestureDetector(
                          onTap: () => _selectGender(gender),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            width: double
                                .infinity, // Make each container take full width
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: isSelected ? Colors.black : Colors.grey,
                                width: 2.0,
                              ),
                              color: isSelected ? Colors.black12 : Colors.white,
                            ),
                            child: Text(
                              gender,
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
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
                widthFactor: 0.9,
                child: ElevatedButton(
                  onPressed: saveGender,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next'),
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
