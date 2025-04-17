import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _NameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              TextFormField(
                controller: _NameController,
                validator:
                    (value) => value!.isEmpty ? "Please enter your Name" : null,
                decoration: InputDecoration(
                  label: Text("Name"),
                  hintText: "Enter your name !",
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _EmailController,
                validator:
                    (value) =>
                        value!.isEmpty ? "Please enter your email" : null,
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "Enter your email !",
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _PasswordController,
                validator:
                    (value) =>
                        value!.isEmpty ? "Please enter your password" : null,
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Enter your Password !",
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: Text("Already have an account ?"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 32),
              MainButton(onTap: () {}, text: "SIGN UP"),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text("Or sign up with social account"),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 64,
                      width: 92,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/Google.png",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 64,
                      width: 92,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/facebook.png",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
