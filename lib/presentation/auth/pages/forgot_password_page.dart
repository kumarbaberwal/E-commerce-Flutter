import 'package:ecommerce/common/bloc/button/button_cubit.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/domain/auth/usecases/send_password_reset_email_use_case.dart';
import 'package:ecommerce/presentation/auth/pages/password_reset_email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      // backgroundColor: AppColors.primary,
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            } else if (state is ButtonSuccessState) {
              AppNavigator.push(context, const PasswordResetEmailPage());
            }
          },
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
                _emailField(),
                const SizedBox(
                  height: 20,
                ),
                _continueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _continueButton() {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          context.read<ButtonCubit>().execute(
                usecase: SendPasswordResetEmailUseCase(),
                params: email.text.trim(),
              );
        },
        title: 'Continue',
      );
    });
  }

  TextField _emailField() {
    return TextField(
      controller: email,
      decoration: const InputDecoration(
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
