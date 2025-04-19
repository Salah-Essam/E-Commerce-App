import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _EmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot password",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 64),
                Text(
                  "Please, enter your email address. You will receive a link to create a new password via email.",
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _EmailController,
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      (value) =>
                          value!.isEmpty ? "Please enter your email" : null,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Enter your email !",
                  ),
                ),
                const SizedBox(height: 32),
                MainButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: "SEND",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
