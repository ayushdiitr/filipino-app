import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/src/ui/screens/splash/relationship.dart';

class Meetscreen extends StatefulWidget {
  const Meetscreen({super.key});

  @override
  _MeetInfoState createState() => _MeetInfoState();
}

class _MeetInfoState extends State<Meetscreen> {
  final Map<String, bool> _selectedOptions = {
    'Male': false,
    'Female': false,
    'Non Binary': false,
    'Everyone': false,
  };

  void _toggleSelection(String key) {
    setState(() {
      _selectedOptions[key] = !_selectedOptions[key]!;
    });
  }

  Future<void> saveMeetChoices() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? choices = [];

    bool anySelected = false;

    // Iterate over the selected options and add the selected keys to the email list
    _selectedOptions.forEach((key, isSelected) {
      if (isSelected) {
        if (!choices.contains(key)) {
          choices.add(key); // Add the selected key (email) to the list
        }
        anySelected = true;
      }
    });

    if (!anySelected) {
      // If no options were selected, show a warning SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one options!')),
      );
      return; // Stop further execution if no options were selected
    }

    // Save data to SharedPreferences
    await prefs.setStringList('choices', choices);
    // Navigate to the next screen after saving data
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Relationship()),
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
                        value: 0.9,
                        color: Colors.black,
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputChip(
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
                        ),
                        SizedBox(height: 12),
                        Text.rich(
                          TextSpan(
                            text: "You'd like to ", // Default text style
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Meet',
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
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  "Let us know who you’re interested in connecting with. This helps us match you with people who meet your preferences and make your experience more enjoyable",
                              style: TextStyle(
                                fontFamily: 'NoirPro',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _selectedOptions.keys.map((String key) {
                        bool isSelected = _selectedOptions[key]!;
                        return GestureDetector(
                          onTap: () => _toggleSelection(key),
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
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                            child: Text(
                              key,
                              style: TextStyle(
                                fontFamily: 'NoirPro',
                                color: isSelected ? Colors.white : Colors.grey,
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
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: () {
                    saveMeetChoices();
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
