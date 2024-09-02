import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_textform_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              AuthField(
                hintText: "Email",
                controller: _emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                isObscureText: true,
                hintText: "Password",
                controller: _passwordController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthGradientButton(
                buttonText: "Log in",
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignupPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: "Don't have an account?  ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppPallete.gradient2,
                                    fontWeight: FontWeight.bold))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
