import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 4,
      ),
      decoration: const BoxDecoration(
        
        color: Colors.black, 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          _buildMenuItem(
            imagePath: "images/account_circle.png",
            label: "Profile",
          ),
          _buildMenuItem(
            imagePath: "images/award_star.png", 
            label: "Explore",
          ),
          _buildMenuItem(
            imagePath: "images/connecting_airports.png", 
            label: "Connect",
          ),
          _buildMenuItem(
            imagePath: "images/favorite.png", 
            label: "Like",
          ),
          _buildMenuItem(
            imagePath: "images/chat.png", 
            label: "Buddies",
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({required String imagePath, required String label}) {
    return Container(
      height: 60,
      width: 60, 
      padding: const EdgeInsets.all(5), 
      color: Colors.black, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 20,
            height: 20,
          ),
          const SizedBox(height: 2), 
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.2,
              letterSpacing: 0.02,
              color: Color(0xFF8E8E8E), 
            ),
          ),
        ],
      ),
    );
  }
}

