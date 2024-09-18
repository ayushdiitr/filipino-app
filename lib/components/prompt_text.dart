import 'package:flutter/material.dart';

class PromptTextScreen extends StatelessWidget {
  final String promptTitle;
  final String promptDesc;
  final bool hasButton;

  const PromptTextScreen({
    Key? key,
    required this.promptTitle,
    this.promptDesc = '',
    this.hasButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
          bottom: 24,
        ),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(12),
            
            
          
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              promptTitle,
              style: const TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: 0.12,
              ),
            ),
            const SizedBox(height: 12),
            if (hasButton)
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(250, 250, 250, 1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color.fromRGBO(235, 235, 235, 1),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 5,
                    ),
                    child: const Text(
                      'Hindi',
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 14,
                        letterSpacing: 0.12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(250, 250, 250, 1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color.fromRGBO(235, 235, 235, 1),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 5,
                    ),
                    child: const Text(
                      'English',
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 14,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                promptDesc,
                style: const TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
