import 'package:flutter/material.dart';
import 'package:welcome_to_batam/page/page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/sign-up':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/destination':
        return MaterialPageRoute(
          builder: (_) => DestinationPage(destination: settings.arguments as String),
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
