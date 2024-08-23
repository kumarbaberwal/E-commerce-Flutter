import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/pages/enter_password_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
            _emailField(),
            const SizedBox(
              height: 20,
            ),
            _continueButton(context),
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

  TextField _emailField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter New Password',
      ),
    );
  }

  Text _signinText() {
    return const Text(
      'Forgot Password',
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
