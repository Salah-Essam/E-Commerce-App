import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/utilities/router.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        title: 'E Commerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFDB3022),
            primary: const Color(0xFFDB3022),
            onPrimary: Colors.white,
            surface: const Color(0xFFF9F9F9),
            onSurface: Colors.black,
          ),

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
        initialRoute: AppRoutes.landingPageRoute,
      ),
    );
  }
}
