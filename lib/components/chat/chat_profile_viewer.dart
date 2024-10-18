import 'package:flutter/material.dart';

class ChatViewer extends StatelessWidget {
  const ChatViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(73),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 2,
                  ),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3AC482), Color(0xFF0FCBDF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(73),
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
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3AC482),
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
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amit',
                  style: TextStyle(
                    fontFamily: 'Baskerville',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 22 / 16,
                    letterSpacing: 0.02,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '13:20 - Hey Glad to connect with you',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 22 / 12,
                    letterSpacing: 0.02,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16,
            color: Color(0xFF1C1B1F),
          ),
        ],
      ),
    );
  }
}
