import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_textform_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              AuthField(
                hintText: "Name",
                controller: _nameController,
              ),
              const SizedBox(
                height: 15,
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
              const AuthGradientButton(
                buttonText: "Sign up",
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account?  ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: "Sign In",
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
