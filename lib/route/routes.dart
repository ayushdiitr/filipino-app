import 'package:flutter/cupertino.dart';
import 'package:testapp/src/ui/chat/main.dart';
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

      case '/chat':
        return CupertinoPageRoute(builder: (_) => ChatPage());
    }

    return null;
  }
}
