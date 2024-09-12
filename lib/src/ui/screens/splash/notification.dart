import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/ui/screens/splash/interest.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  bool _isLocationEnabled = false;

  @override
  void initState() {
    super.initState();
    _requestNotificationPermission();
  }

  // Request notification permission
  Future<void> _requestNotificationPermission() async {
    var status = await Permission.notification.status;

    if (status.isDenied) {
      // Request permission if it hasn't been granted
      status = await Permission.notification.request();
    }

    if (status.isPermanentlyDenied) {
      // Handle if permission is permanently denied
      print('Notification permissions are permanently denied.');
    } else if (status.isGranted) {
      // Navigate to next screen when permission is granted
      _navigateToNextScreen();
    }
  }

  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        border: Border.all(
                          color: const Color(0xFFE1E1E1),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Image.asset(
                        "images/notification.png",
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Allow ',
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'notifications ',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Baskerville',
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 0),
                    child: Text.rich(
                      TextSpan(
                        text:
                            "and we'll keep you updated throughout your journey.",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                    child: Text(
                      "Enable notifications to get the latest updates on matches, messages, and app features. Never miss out on exciting opportunities!",
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _requestNotificationPermission();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        textStyle: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 22 / 14,
                          letterSpacing: 0.04,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Allow Notifications'),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF1F1F1F),
                        textStyle: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 22 / 14,
                          letterSpacing: 0.04,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('Skip'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
