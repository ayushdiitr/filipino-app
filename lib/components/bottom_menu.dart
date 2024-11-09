import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //current route
    final currentRoute = ModalRoute.of(context)?.settings.name;
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
            context: context,
            path: '/profile',
            isSelected: currentRoute == '/profile',
          ),
          _buildMenuItem(
            imagePath: "images/award_star.png",
            label: "Explore",
            context: context,
            path: '/explore',
            isSelected: currentRoute!.startsWith('/explore'),
          ),
          _buildMenuItem(
            imagePath: "images/connecting_airports.png",
            label: "Connect",
            context: context,
            path: '/',
            isSelected: currentRoute == '/',
          ),
          _buildMenuItem(
            imagePath: "images/favorite.png",
            label: "Like",
            context: context,
            path: '/like',
            isSelected: currentRoute == '/like',
          ),
          _buildMenuItem(
            imagePath: "images/chat.png",
            label: "Buddies",
            context: context,
            path: '/chat',
            isSelected: currentRoute == '/chat',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      {required String imagePath,
      required String label,
      required String path,
      required bool isSelected,
      required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specified path if it's not the current route
        if (ModalRoute.of(context)?.settings.name != path && path.isNotEmpty) {
          Navigator.pushNamed(context,
              path); // This replaces the current route with the new one
        }
      },
      child: Container(
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
              color: isSelected ? Colors.white : Color(0xFF8E8E8E),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.2,
                letterSpacing: 0.02,
                color: isSelected ? Colors.white : const Color(0xFF8E8E8E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
