import 'package:flutter/material.dart';
import 'package:traba/model/model.dart';
import 'package:traba/page/page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/sign-up':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/team':
        return MaterialPageRoute(
          builder: (_) => TeamPage(team: settings.arguments as Team),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold();
      },
    );
  }
}
