import 'package:e_commerce/utilities/router.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        primaryColor: const Color(0xFFDB3022),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 216, 216, 216),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 216, 216, 216),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: const Color(0xFFDB3022)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: const Color(0xFFDB3022)),
          ),
        ),
      ),
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.LoginPage,
    );
  }
}
