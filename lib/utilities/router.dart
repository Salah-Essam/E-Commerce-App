import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/ForgotPasswordPage.dart';
import 'package:e_commerce/views/pages/BottomNavbar.dart';
import 'package:e_commerce/views/pages/LoginPage.dart';
import 'package:e_commerce/views/pages/RegisterPage.dart';
import 'package:e_commerce/views/pages/landingPage.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.BottomNavbar:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavbar(),
        settings: settings,
      );
    case AppRoutes.ForgotPassword:
      return CupertinoPageRoute(
        builder: (_) => const ForgotPasswordPage(),
        settings: settings,
      );
    case AppRoutes.LoginPage:
      return CupertinoPageRoute(
        builder: (_) => const LoginPage(),
        settings: settings,
      );
    case AppRoutes.RegisterPage:
      return CupertinoPageRoute(
        builder: (_) => const RegisterPage(),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
