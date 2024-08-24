import 'package:cubit_form/cubit_form.dart';
import 'package:ecommerce/common/bloc/button/button_cubit.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/data/auth/models/user_signin_request.dart';
import 'package:ecommerce/domain/auth/usecases/signin_use_case.dart';
import 'package:ecommerce/presentation/auth/pages/forgot_password_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninRequest user;
  final TextEditingController password = TextEditingController();
  EnterPasswordPage({super.key, required this.user});

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
        child: BlocProvider(
          create: (context) => ButtonCubit(),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (BuildContext context, ButtonState state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              } else if (state is ButtonSuccessState) {
                AppNavigator.push(context, const Scaffold());
              }
            },
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
                _continueButton(context),
                const SizedBox(
                  height: 20,
                ),
                _forgotPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          user.password = password.text.trim();
          context.read<ButtonCubit>().execute(
                usecase: SigninUseCase(),
                params: user,
              );
        },
        title: 'Continue',
      );
    });
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
              AppNavigator.push(context, ForgotPasswordPage());
            },
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }

  TextField _passwordField() {
    return TextField(
      controller: password,
      decoration: const InputDecoration(
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
