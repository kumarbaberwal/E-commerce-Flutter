import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/pages/enter_password_page.dart';
import 'package:ecommerce/presentation/auth/pages/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
      ),
      // backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(),
            const SizedBox(
              height: 20,
            ),
            _emailField(),
            const SizedBox(
              height: 20,
            ),
            _continueButton(context),
            const SizedBox(
              height: 20,
            ),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  BasicAppButton _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPasswordPage());
      },
      title: 'Continue',
    );
  }

  RichText _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: "Don't you have an account? ",
        ),
        TextSpan(
          text: 'Create one',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignupPage());
            },
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }

  TextField _emailField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Text _signinText() {
    return const Text(
      'Sign in',
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
