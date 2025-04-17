import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/LoginPage.dart';
import 'package:e_commerce/views/pages/RegisterPage.dart';
import 'package:e_commerce/views/pages/landingPage.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.LoginPage:
      return CupertinoPageRoute(builder: (_) => LoginPage());
    case AppRoutes.RegisterPage:
      return CupertinoPageRoute(builder: (_) => RegisterPage());
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(builder: (_) => LandingPage());
  }
}
