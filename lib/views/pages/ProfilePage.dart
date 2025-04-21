import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ProfilePage"),
        MainButton(
          onTap: () {
            auth.signOut();
          },
          text: "Sign Out",
        ),
      ],
    );
  }
}
