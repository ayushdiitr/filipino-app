import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/ui/screens/splash/beliefsAndOpinions.dart';
import 'package:testapp/src/ui/screens/splash/faceTime.dart';
import 'package:testapp/src/ui/screens/splash/genderScreen.dart';
import 'package:testapp/src/ui/screens/splash/main.dart';

class Beliefsandopinions extends StatefulWidget {
  @override
  _BeliefsandopinionsState createState() => _BeliefsandopinionsState();
}

class _BeliefsandopinionsState extends State<Beliefsandopinions> {
  String selectedDrinkingOption = '';
  String selectedSmokingOption = '';

  List<String> interests = [
    'Always',
    'Sometimes',
    'Rarely',
    'Never',
    'I am sober',
  ];
  List<String> selectedInterests = [];

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.isEmpty) {
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                  child: Center(
                    child: LinearProgressIndicator(
                      value: 0.7,
                      color: Colors.black,
                      backgroundColor: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
                const InputChip(
                  label: Text(
                    'LIFESTYLE',
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
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text.rich(
                    TextSpan(
                      text: "Let's talk about your ",
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        letterSpacing: 0.02,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Beliefs and opinions',
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

                // Description Text
                const Text(
                  "Choose your preferences to help us find matches that meet your lifestyle.",
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.04,
                    color: Color(0xFF3F4A61), // Secondary-600 color
                  ),
                ),

                const SizedBox(height: 24),

                // Drinking options
                Expanded(
                  child: ListView(
                    children: [
                      InterestCategory(
                        title: 'Religion',
                        interests: interests,
                        selectedInterests: selectedInterests,
                        onInterestToggle: toggleInterest,
                      ),
                      InterestCategory(
                        title: 'Politics',
                        interests: interests,
                        selectedInterests: selectedInterests,
                        onInterestToggle: toggleInterest,
                      ),
                    ],
                  ),
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
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhotoScreenBody(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF1F1F1F), // Primary-700 color
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
                    widthFactor: 1,
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
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Baskerville',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
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
                  border: Border.all(color: Colors.grey),
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
