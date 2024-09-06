import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/ui/screens/splash/main.dart';

class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  _InterestSelectionScreenState createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  List<String> interests = [
    '🎨 Art',
    '🎨 Design',
    '💄 Makeup',
    '📷 Photography',
    '📝 Writing',
    '🎤 Singing',
    '🕺 Dancing',
    '🧶 Craft',
    '🎥 Making videos'
  ];
  List<String> selectedInterests = [];

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 5) {
        selectedInterests.add(interest);
      }
    });
  }

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
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                  child: Center(
                    child: LinearProgressIndicator(
                      value: 0.7,
                      color: Colors.black,
                      backgroundColor: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
                // "Select your Interests" Text
                const InputChip(
                  label: Text(
                    'INTEREST',
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
                  backgroundColor: Colors.white, // White background color
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Select your ',
                    style: const TextStyle(
                      fontFamily: 'NoirPro',
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      letterSpacing: 0.02,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Interests ',
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
                const SizedBox(height: 16),
                // Description Text
                const Text(
                  "Choose your height to help us find matches that meet your preferences.",
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.04,
                    color: Color(0xFF3F4A61),
                  ),
                ),
                const SizedBox(height: 16),
                // Interest categories
                Expanded(
                  child: ListView(
                    children: [
                      InterestCategory(
                        title: 'Creativity',
                        interests: interests,
                        selectedInterests: selectedInterests,
                        onInterestToggle: toggleInterest,
                      ),
                      InterestCategory(
                        title: 'Sports',
                        interests: interests,
                        selectedInterests: selectedInterests,
                        onInterestToggle: toggleInterest,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Next button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: const TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.04,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Center(
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
          // Hobby count in the top-right corner
          Positioned(
            top: 40,
            right: 16,
            child: AnimatedOpacity(
              opacity: selectedInterests.isNotEmpty ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Text(
                '${selectedInterests.length}/5',
                style: const TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.04,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InterestCategory extends StatelessWidget {
  final String title;
  final List<String> interests;
  final List<String> selectedInterests;
  final Function(String) onInterestToggle;

  const InterestCategory({
    super.key,
    required this.title,
    required this.interests,
    required this.selectedInterests,
    required this.onInterestToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'NoirPro',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.04,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: interests.map((interest) {
            final isSelected = selectedInterests.contains(interest);
            return GestureDetector(
              onTap: () => onInterestToggle(interest),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  interest,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
