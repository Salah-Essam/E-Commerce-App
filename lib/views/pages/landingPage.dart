import 'package:e_commerce/controllers/AuthController.dart';
import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/views/pages/BottomNavbar.dart';
import 'package:e_commerce/views/pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return ChangeNotifierProvider<AuthController>(
              create: (_) {
                return AuthController(auth: auth);
              },
              child: const LoginPage(),
            );
          }
          return Provider<Database>(
            create: (_) => FirestoreDatabase(uid: user.uid),
            child: const BottomNavbar(),
          );
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
