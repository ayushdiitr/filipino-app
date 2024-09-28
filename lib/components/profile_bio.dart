import 'package:flutter/material.dart';

class BioSection extends StatefulWidget {
  final String title;
  final String subtitle;

  const BioSection({super.key, required this.title, required this.subtitle});

  @override
  _BioSectionState createState() => _BioSectionState();
}

class _BioSectionState extends State<BioSection> {
  // List of languages
  final List<String> languages = ['Hindi', 'English', 'French', 'German'];
  
  // To keep track of selected languages
  final List<String> selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF), // Background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          Text(
            widget.title,
            style: const TextStyle(
              fontFamily: 'Baskerville',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 0.02,
              color: Color(0xFF1F1F1F), // Text color
            ),
          ),
          const SizedBox(height: 4),
          // Subtitle
          Text(
            widget.subtitle,
            style: const TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.2,
              letterSpacing: 0.02,
              color: Color(0xFF3F4A61), // Secondary text color
            ),
          ),
          SizedBox(height: 12),

          // Box with multi-select buttons
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: BoxDecoration(
              
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFFF5F5F5),
               // var(--Neutral-100, #F5F5F5)
                width: 1,
              ),
            ),
            child: Wrap(
              spacing: 10, // Gap between buttons
              children: languages.map((language) {
                final isSelected = selectedLanguages.contains(language);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedLanguages.remove(language);
                      } else {
                        selectedLanguages.add(language);
                      }
                    });
                  },
                  child: Container(
                    width: 85,
                    //height: 33,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA), // Button background
                      border: Border.all(
                        color: Color(0xFFF5F5F5), // Button border
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                      
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: Color(0xFF1F1F1F).withOpacity(0.1), // Shadow when selected
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        language,
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.2, // Line-height: 16.8px
                          letterSpacing: 0.02,
                          color: Color(0xFF1F1F1F), // Text color
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
