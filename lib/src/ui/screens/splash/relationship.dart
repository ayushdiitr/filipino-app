import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/src/ui/screens/splash/height_selector.dart';

class Relationship extends StatefulWidget {
  const Relationship({super.key});

  @override
  _RelationshipState createState() => _RelationshipState();
}

class _RelationshipState extends State<Relationship> {
  final Map<String, bool> _selectedOptions = {
    'A relationship': false,
    'Nothing Serious': false,
    'Figuring out my type': false,
  };

  void _toggleSelection(String key) {
    setState(() {
      _selectedOptions[key] = !_selectedOptions[key]!;
    });
  }

  Future<void> saveRelationShip() async {
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
    await prefs.setStringList('relationChoices', choices);

    // Navigate to the next screen after saving data
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HeightSelector()),
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
                        text: 'What ', // Default text style
                        style: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'type of relationship ',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: 'are you looking for?', // Default text style
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
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
                      children: _selectedOptions.keys.map((String key) {
                        bool isSelected = _selectedOptions[key]!;
                        return GestureDetector(
                          onTap: () => _toggleSelection(key),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            width: double
                                .infinity, // Make each container take full width
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: isSelected ? Colors.black : Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  key,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                                // Container(
                                //   width: 24.0,
                                //   height: 24.0,
                                //   decoration: BoxDecoration(
                                //     shape: BoxShape.circle,
                                //     border: Border.all(
                                //       color:Colors.grey,
                                //       width: 2.0,
                                
                                //     color: isSelected
                                //         ? Colors.white
                                //         : Colors.transparent,
                                //   ),
                                //   child: isSelected
                                //       ? const Icon(
                                //           Icons.check,
                                //           color: Colors.black,
                                //           size: 16.0,
                                //         )
                                //       : null,
                                // ),
                              ],
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
                  onPressed: () {
                    // Print debug statement
                    saveRelationShip();
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
