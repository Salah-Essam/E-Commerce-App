import 'package:e_commerce/controllers/AuthController.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _NameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider(
      create: (_) => AuthController(auth: auth),
      child: Consumer<AuthController>(
        builder: (_, model, __) {
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
                        "Sign up",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 64),
                      TextFormField(
                        onChanged: model.updateName,
                        controller: _NameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "Please enter your Name"
                                    : null,
                        decoration: InputDecoration(
                          label: Text("Name"),
                          hintText: "Enter your name !",
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        onChanged: model.updateEmail,
                        controller: _EmailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "Please enter your email"
                                    : null,
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
                          child: Text("Already have an account ?"),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
                      MainButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            debugPrint(
                              "${model.name}  +  ${model.email}  +  ${model.password}",
                            );
                            model.login(false);
                            Navigator.of(context).pop();
                          }
                        },
                        text: "SIGN UP",
                      ),
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
            ),
          );
        },
      ),
    );
  }
}
