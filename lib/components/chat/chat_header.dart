import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black, 
            onPressed: () {
              
            },
          ),
          const SizedBox(width: 8),
          
          Stack(
            children: [
              
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(73),
                  
                  
                ),
                child: ClipRRect(
                  
                  child: Image.asset(
                    'images/viewer.png', 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              Positioned(
                top: 40,
                left: 40,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Color(0xFF3AC482), 
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, 
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),

          
          const SizedBox(width: 18), 
          
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  'Ajay Nagar',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 21.03 / 14,
                    letterSpacing: 0.02,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4), 
                
                
                Text(
                  '@ajngr2002',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 18.02 / 12,
                    letterSpacing: 0.02,
                    color: Color(0xFF7E919A), 
                  ),
                ),
              ],
            ),
          ),

          
          const Icon(
            Icons.more_vert,
            size: 24,
            color: Color(0xFF1C1B1F), 
          ),
        ],
      ),
    );
  }
}


