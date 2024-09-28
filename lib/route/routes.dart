import 'package:flutter/cupertino.dart';
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
    }

    return null;
  }
}
