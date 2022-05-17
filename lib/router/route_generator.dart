import 'package:project_mak/router/routes.dart';
import 'package:project_mak/screens/auth/otp_verification.dart';
import 'package:project_mak/screens/auth/venue_login.dart';
import 'package:flutter/material.dart';
import '../screens/auth/choose_login.dart';
import '../screens/auth/guest_login.dart';
import '../screens/dashboard/dashboard.dart';
import '../screens/feed/feed_page.dart';
import '../screens/splash_screen.dart';
import '../screens/venue_profile/venue_profile_screen.dart';
import '../screens/venue_registration/venue_registration_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.chooseLogin:
        return MaterialPageRoute(builder: (context) => const ChooseLogin());
      case Routes.venueLogin:
        return MaterialPageRoute(builder: (context) => const VenueLogin());
      case Routes.guestLogin:
        return MaterialPageRoute(builder: (context) => const GuestLogin());
      case Routes.otpVerification:
        return MaterialPageRoute(builder: (context) => const OTPVerification());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (context) => const Dashboard());
      case Routes.feedPage:
        return MaterialPageRoute(builder: (context) => const FeedPage());
      case Routes.venueRegistrationScreen:
        return MaterialPageRoute(
            builder: (context) => const VenueRegistrationScreen());
      case Routes.venueProfileScreen:
        return MaterialPageRoute(
            builder: (context) => const VenueProfileScreen());
      default:
        return MaterialPageRoute(builder: (context) => const ChooseLogin());
    }
  }
}
