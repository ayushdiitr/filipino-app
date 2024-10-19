import 'package:flutter/cupertino.dart';
import 'package:testapp/src/ui/chat/main.dart';
import 'package:testapp/src/ui/explore/explore_profiles.dart';
import 'package:testapp/src/ui/explore/main.dart';
import 'package:testapp/src/ui/homepage/main.dart';
import 'package:testapp/src/ui/homepage/profile.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => HomePage());

      case '/profile':
        return CupertinoPageRoute(builder: (_) => ProfilePage());

      case '/explore':
        return CupertinoPageRoute(builder: (_) => ExplorePage());

      case '/explore/new':
        return CupertinoPageRoute(
          builder: (_) => ExploreProfilePage(
            currentPath: 'New',
          ),
        );

      case '/explore/verified':
        return CupertinoPageRoute(
          builder: (_) => ExploreProfilePage(
            currentPath: 'Verified',
          ),
        );

      case '/explore/active':
        return CupertinoPageRoute(
          builder: (_) => ExploreProfilePage(
            currentPath: 'Active',
          ),
        );

      case '/chat':
        return CupertinoPageRoute(builder: (_) => ChatPage());
    }

    return null;
  }
}
