import 'package:flutter/material.dart';

class BioSection extends StatefulWidget {
  final String title;
  final String subtitle;

  const BioSection({super.key, required this.title, required this.subtitle});

  @override
  _BioSectionState createState() => _BioSectionState();
}

class _BioSectionState extends State<BioSection> {
  
  final List<String> languages = ['Hindi', 'English', 'French', 'German'];

  
  final List<String> selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Text(
            widget.title,
            style: const TextStyle(
              fontFamily: 'Baskerville',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 0.02,
              color: Color(0xFF1F1F1F), 
            ),
          ),
          const SizedBox(height: 4),
          
          Text(
            widget.subtitle,
            style: const TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.2,
              letterSpacing: 0.02,
              color: Color(0xFF3F4A61), 
            ),
          ),
          const SizedBox(height: 12),

          
          GestureDetector(
            onTap: () {
              _showLanguageSelectionDialog();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFF5F5F5),
                  width: 1,
                ),
              ),
              child: selectedLanguages.isNotEmpty
                  ? Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: selectedLanguages.map((language) {
                        return Chip(
                          label: Text(
                            language,
                            style: const TextStyle(
                              fontFamily: 'NoirPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: 0.02,
                              color: Color(0xFF1F1F1F), 
                            ),
                          ),
                          backgroundColor: const Color(0xFFFAFAFA), 
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.red, 
                          ),
                          onDeleted: () {
                            
                            setState(() {
                              selectedLanguages.remove(language);
                            });
                          },
                        );
                      }).toList(),
                    )
                  : const Text(
                      'Choose the languages you know',
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        height: 1.2,
                        letterSpacing: 0.02,
                        color: Color(0xFF596580), 
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  
  void _showLanguageSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Select Languages',
            style: TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: languages.map((language) {
                    return CheckboxListTile(
                      title: Text(
                        language,
                        style: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: 0.02,
                          color: Color(0xFF1F1F1F), 
                        ),
                      ),
                      value: selectedLanguages.contains(language),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedLanguages.add(language);
                          } else {
                            selectedLanguages.remove(language);
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading, 
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F1F1F),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {}); 
              },
            ),
          ],
        );
      },
    );
  }
}
