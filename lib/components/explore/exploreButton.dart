import 'package:flutter/material.dart';
 

class ExploreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175, // Fill (175px)
      height: 52, // Fill (52px)
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration:  BoxDecoration(
        color: Color(0xFF1F1F1F), // Background: var(--Primary-700, #1F1F1F)
        borderRadius: BorderRadius.circular(4),
          
        ),
        
      
      child:  const Text(
        "Like",
        textAlign: TextAlign.center,
        
        style: TextStyle(
          fontFamily: 'NoirPro',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          //height: 16.8 / 14, // line-height
          letterSpacing: 0.02,
          color: Colors.white, // Adjust text color as needed
          
        ),
        
      ),
    );
  }
}
