import 'package:e_commerce/controllers/AuthController.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();

  Future<void> _submit(AuthController model) async {
    try {
      await model.Login(true);

      Navigator.of(context).pushNamed(AppRoutes.BottomNavbar);
    } catch (e) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text(
                "Error",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              content: Text(
                e.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 64),
                    TextFormField(
                      onChanged: model.updateEmail,
                      controller: _EmailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                      onChanged: model.updatePassword,
                      controller: _PasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator:
                          (value) =>
                              value!.isEmpty
                                  ? "Please enter your password"
                                  : null,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: "Enter your Password !",
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Text("Forgot your password ?"),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.ForgotPassword);
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    MainButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint("${model.email}  +  ${model.password}");
                          _submit(model);
                        }
                      },
                      text: "LOGIN",
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(
                          "Don't have an account ? \n             Register",
                        ),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.RegisterPage);
                        },
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Or login with social account"),
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
          ),
        );
      },
    );
  }
}
