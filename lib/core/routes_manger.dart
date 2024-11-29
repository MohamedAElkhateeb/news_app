import 'package:flutter/material.dart';
import '../presentation/screens/home/home.dart';
import '../presentation/screens/home/tabs/categories/articales_detailes/articales_details.dart';
import '../presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String articleDetails = '/articleDetails';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
       case home:
         return MaterialPageRoute(
           builder: (context) => Home(),
         );
      case articleDetails:
        return MaterialPageRoute(
          builder: (context) {
            return ArticleDetails();
          },
          settings: settings,
        );
    }
  }
}
