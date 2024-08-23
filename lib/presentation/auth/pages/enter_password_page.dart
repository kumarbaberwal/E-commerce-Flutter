import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/pages/forgot_password_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
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
            _passwordField(),
            const SizedBox(
              height: 20,
            ),
            _continueButton(),
            const SizedBox(
              height: 20,
            ),
            _forgotPassword(context),
          ],
        ),
      ),
    );
  }

  BasicAppButton _continueButton() {
    return BasicAppButton(
      onPressed: () {},
      title: 'Continue',
    );
  }

  RichText _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: "Forgot Password? ",
        ),
        TextSpan(
          text: 'Reset',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, const ForgotPasswordPage());
            },
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }

  TextField _passwordField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Password',
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
