import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/components/profile_heading.dart';
import 'package:testapp/components/swipe_card.dart';
import 'package:testapp/src/ui/animation/onBoarding2.dart';
import 'package:testapp/src/ui/animation/onBoarding3.dart';
import 'package:testapp/src/ui/animation/matching.dart';
import 'package:testapp/src/ui/animation/onboarding.dart';
import 'package:testapp/src/ui/chat/main.dart';
import 'package:testapp/src/ui/explore/explore_profiles.dart';
import 'package:testapp/src/ui/explore/main.dart';
import 'package:testapp/src/new/homepage/main.dart';
import 'package:testapp/src/new/homepage/profile.dart';
import 'package:testapp/src/ui/chat/message.dart';
import 'package:testapp/src/ui/likes/main.dart';
import 'package:testapp/src/ui/likes/userDetailed.dart';
import 'package:testapp/src/ui/splash/main.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    final Uri uri = Uri.parse(settings.name!);

    // Define static routes
    switch (settings.name) {
      case '/':
        return _cupertinoRoute( MatchingScreen(), '/');
        return _cupertinoRoute(OnboardingScreen(currentPath: '/welcome'), '/');

      case '/welcome':
        return _cupertinoRoute(
            OnboardingScreen2(currentPath: '/match'), '/welcome');

      case '/match':
        return _cupertinoRoute(OnboardingScreen3(), '/match');

      case '/login':
        return _cupertinoRoute(const LoginScreen(), '/login');

      case '/profile':
        return _cupertinoRoute(ProfilePage(), '/profile');

      case '/profile/name':
        return _cupertinoRoute(
          SwipeCard(
            imgUrl: 'https://placehold.co/400x600',
            name: 'Anshika',
            bio: 'SWE',
            details: {
              'age': 24,
              'location': 'India',
              'education': 'B.Tech',
              'job': 'Software Engineer',
            },
            onSwipeComplete: (param) {
              print('Swipe completed');
            },
          ),
          '/profile/name',
        );

      case '/like':
        return _cupertinoRoute(LikePage(), '/like');

      case '/like/details':
        return _cupertinoRoute(const LikedUserDetailed(), '/like/details');

      case '/explore':
        return _cupertinoRoute(ExplorePage(), '/explore');

      case '/explore/new':
        return _cupertinoRoute(
            const ExploreProfilePage(currentPath: 'New'), '/explore/new');

      case '/explore/verified':
        return _cupertinoRoute(
            const ExploreProfilePage(currentPath: 'Verified'),
            '/explore/verified');

      case '/explore/active':
        return _cupertinoRoute(
            const ExploreProfilePage(currentPath: 'Active'), '/explore/active');

      case '/chat':
        return _cupertinoRoute(ChatPage(), '/chat');
    }

    // Handle dynamic routes like `/chat/message/:userId`
    if (uri.pathSegments.isNotEmpty) {
      // `/chat/message/:userId` route
      if (uri.pathSegments[0] == 'chat' &&
          uri.pathSegments.length > 1 &&
          uri.pathSegments[1] == 'message' &&
          uri.pathSegments.length > 2) {
        final String userId = uri.pathSegments[2];
        return _cupertinoRoute(
            ChatScreen(
              conversationId: userId,
              currentUserId: '3ab787ad-9a9a-4a52-a0c2-fd06fbd6745c',
              recipientUserId: '9b885766-be84-460a-a22a-b0602773e39c',
            ),
            '/chat/message/$userId');
      }

      // `/profile/:dynamicSegment` route
      if (uri.pathSegments[0] == 'profile' && uri.pathSegments.length > 1) {
        final String dynamicSegment = uri.pathSegments[1];
        return _cupertinoRoute(
            MyProfile(currentPath: dynamicSegment), '/profile/$dynamicSegment');
      }
    }

    // Fallback for unmatched routes
    return _cupertinoRoute(const NotFoundScreen(), '/404');
  }

  // Helper method to create a CupertinoPageRoute
  CupertinoPageRoute _cupertinoRoute(Widget widget, String routeName) {
    return CupertinoPageRoute(
      builder: (_) => widget,
      settings: RouteSettings(name: routeName),
    );
  }
}

// Example NotFoundScreen
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404 - Page Not Found')),
      body: const Center(
        child: Text('The page you are looking for does not exist.'),
      ),
    );
  }
}
