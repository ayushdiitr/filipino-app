import 'package:flutter/cupertino.dart';
import 'package:testapp/src/ui/chat/main.dart';
import 'package:testapp/src/ui/explore/explore_profiles.dart';
import 'package:testapp/src/ui/explore/main.dart';
import 'package:testapp/src/new/homepage/main.dart';
import 'package:testapp/src/new/homepage/profile.dart';
import 'package:testapp/src/ui/chat/message.dart';
import 'package:testapp/src/ui/likes/main.dart';
import 'package:testapp/src/ui/splash/main.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (_) => HomePage(),
          settings: const RouteSettings(name: '/'), // Explicitly set route name
        );

      case '/login':
        return CupertinoPageRoute(
          builder: (_) => LoginScreen(),
          settings: const RouteSettings(name: '/login'),
        );

      case '/profile':
        return CupertinoPageRoute(
          builder: (_) => ProfilePage(),
          settings: const RouteSettings(name: '/profile'),
        );

      case '/like':
        return CupertinoPageRoute(
          builder: (_) => LikePage(),
          settings: const RouteSettings(name: '/like'),
        );

      case '/explore':
        return CupertinoPageRoute(
            builder: (_) => ExplorePage(),
            settings: const RouteSettings(name: '/explore'));

      case '/explore/new':
        return CupertinoPageRoute(
          builder: (_) => ExploreProfilePage(currentPath: 'New'),
          settings: const RouteSettings(name: '/explore/new'),
        );

      case '/explore/verified':
        return CupertinoPageRoute(
          builder: (_) => ExploreProfilePage(currentPath: 'Verified'),
          settings: const RouteSettings(name: '/explore/verified'),
        );

      case '/explore/active':
        return CupertinoPageRoute(
          builder: (_) => ExploreProfilePage(currentPath: 'Active'),
          settings: const RouteSettings(name: '/explore/active'),
        );

      case '/chat':
        return CupertinoPageRoute(
            builder: (_) => ChatPage(),
            settings: const RouteSettings(name: '/chat'));

      case '/chat/message':
        return CupertinoPageRoute(builder: (_) => ChatScreen());
    }

    return null;
  }
}
