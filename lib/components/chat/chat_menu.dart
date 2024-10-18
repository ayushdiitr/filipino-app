import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, 
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Text(
            'Chats',
            style: TextStyle(
              fontFamily: 'Baskerville',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 22 / 20, 
              letterSpacing: 0.02,
              color: Colors.black.withOpacity(0.9), 
            ),
          ),
          Row(
            children: [
              // Recents Text
              Text(
                'Recents',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 22 / 14, 
                  letterSpacing: 0.02,
                  color: Colors.black.withOpacity(0.65), 
                ),
              ),
              SizedBox(width: 8), 
              
              Icon(
                Icons.filter_list,
                size: 24,
                color: Colors.black.withOpacity(0.9), 
              ),
            ],
          ),
        ],
      ),
    );
  }
}
