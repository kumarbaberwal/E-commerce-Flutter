import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/data/auth/models/user_creation_request.dart';
import 'package:ecommerce/presentation/auth/pages/gender_and_age_selection_page.dart';
import 'package:ecommerce/presentation/auth/pages/signin_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      // backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Padding(
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
              _firstNameField(),
              const SizedBox(
                height: 20,
              ),
              _lastNameField(),
              const SizedBox(
                height: 20,
              ),
              _emailField(),
              const SizedBox(
                height: 20,
              ),
              _passwordField(),
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
      ),
    );
  }

  BasicAppButton _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionPage(
            userCreationRequest: UserCreationRequest(
              firstName: firstName.text.trim(),
              lastName: lastName.text.trim(),
              email: email.text.trim(),
              password: password.text.trim(),
            ),
          ),
        );
      },
      title: 'Continue',
    );
  }

  RichText _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: "Do you have an account? ",
        ),
        TextSpan(
          text: 'Signin',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.pushAndRemoveUntil(context, SigninPage());
            },
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }

  TextField _emailField() {
    return TextField(
      controller: email,
      decoration: const InputDecoration(
        hintText: 'Email Address',
      ),
    );
  }

  TextField _firstNameField() {
    return TextField(
      controller: firstName,
      decoration: const InputDecoration(
        hintText: 'Firstname',
      ),
    );
  }

  TextField _lastNameField() {
    return TextField(
      controller: lastName,
      decoration: const InputDecoration(
        hintText: 'Lastname',
      ),
    );
  }

  TextField _passwordField() {
    return TextField(
      controller: password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Text _signinText() {
    return const Text(
      'Create Account',
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
