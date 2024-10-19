import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            width: 311, 
            padding: const EdgeInsets.all(16.0), 
            decoration: const BoxDecoration(
              
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Est molestie cras quis commodo enim enim iaculis. Fermentum augue aliquet lorem enim sem egestas tristique.",
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Colors.black.withOpacity(0.6),
                
                height: 1.5, 
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 8.0), 
            child: Text(
              "10:25",
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.3),
                letterSpacing: 0.02,
              ),
            ),
          ),

          const SizedBox(height: 24),

          
          Center(
            child: Container(
              width: 74, 
              height: 22, 
              
              decoration: BoxDecoration(
                color: Color(0xFFD1D1D6),
                borderRadius: BorderRadius.circular(78),
              ),
              child: Container(
                width: 54,
                height: 15,
              
              child: const Center(
                child: Text(
                  "2 : 30 PM",
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                    letterSpacing: 0.02,
                  ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24), 

          
          Container(
            width: double.infinity, 
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(4),
                bottomLeft: Radius.circular(16),
              ),
              
            ),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Est molestie cras quis commodo enim enim iaculis.",
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Colors.black.withOpacity(0.6),
                
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
