import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                            width: double.infinity, // Make each container take full width
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
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected ? Colors.white : Colors.grey,
                                      width: 2.0,
                                    ),
                                    color: isSelected ? Colors.white : Colors.transparent,
                                  ),
                                  child: isSelected
                                      ? const Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 16.0,
                                  )
                                      : null,
                                ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    // Print debug statement
                    print("Button pressed. Selected Relationship:");
                    // Print selected options to the terminal
                    print("Selected Relationship:");
                    _selectedOptions.forEach((key, value) {
                      if (value) {
                        print(key);
                      }
                    });
                    // Define what happens when the button is pressed
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const PhoneLogin()),
                    // );
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
