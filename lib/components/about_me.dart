import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50, // Set a fixed height for the row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First row with icon and text
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max, // To wrap content only
                      children: [
                        Icon(Icons.man, size: 24),
                        SizedBox(width: 8),
                        Text("Female", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),

                // Vertical divider
                VerticalDivider(
                  thickness: 1,
                  color: Color.fromRGBO(238, 238, 238, 1),
                ),

                // Second row with icon and text
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max, // To wrap content only
                      children: [
                        Icon(Icons.pin_drop, size: 24),
                        SizedBox(width: 8),
                        Text("India", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),

                // Vertical divider
                VerticalDivider(
                  thickness: 1,
                  color: Color.fromRGBO(238, 238, 238, 1),
                ),

                // Third row with icon and text
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max, // To wrap content only
                      children: [
                        Icon(Icons.cake, size: 24),
                        SizedBox(width: 8),
                        Text("20", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color.fromRGBO(238, 238, 238, 1),
          ),
          const SizedBox(height: 16),
          const Text(
            "About Me",
            style: TextStyle(
              fontFamily: 'NoirPro',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  
                  letterSpacing: 0.12,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            
            
            
        
              child: const Text(
                "Lorem ipsum dolor sit amet consectetur. Ullamcorper massa ut placerat nunc lacinia. Tortor vel ultrices elementum magna suscipit ipsum eget vel. Enim enim tempor at viverra ut leo quis egestas. Facilisis amet mattis facilisi consectetur ultrices dolor iaculis ac.",
                style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                height: 1.5,
                color: Colors.black
              ),
              textAlign: TextAlign.left,

              ),

            ),
            const SizedBox(height: 32),
            Container(
              
              child: const Text(
                'INTERESTS',

                style: TextStyle(

                  fontFamily: 'NoirPro',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  
                  letterSpacing: 0.12,

                ),
                textAlign: TextAlign.left,
                 

              ),
            
            ),
            
             const SizedBox(height: 16),
          // Interests boxes
          Wrap(
            spacing: 10, // Gap between boxes
            runSpacing: 10, // Gap between rows
            children: [
              interestBox('🚜 Machine'),
              interestBox('🧦 Textile'),
              interestBox('🧑‍🎨 Design'),
              interestBox('🧑‍🎨 Design'),
              interestBox('🎨 Arts'),
            ],
          ),
        ],
      ),
    );
  }
  Widget interestBox(String text) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 102,
        minHeight: 37,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA), // Background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
        ),
        border: Border.all(
          color: const Color(0xFFF5F5F5), // Border color
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'NoirPro',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.12,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,  
        ),
      ),
       
            
            

            

          
          
            

          
        
      
      
    );
  }       
}
