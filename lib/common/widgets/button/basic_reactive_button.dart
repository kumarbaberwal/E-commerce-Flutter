import 'package:cubit_form/cubit_form.dart';
import 'package:ecommerce/common/bloc/button/button_cubit.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:flutter/material.dart';

class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? height;
  final double? width;
  const BasicReactiveButton(
      {required this.onPressed,
      this.title = '',
      this.height,
      this.width,
      this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loading();
        }
        return _initial();
      },
    );
  }

  ElevatedButton _initial() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: content ??
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
    );
  }

  ElevatedButton _loading() {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: const SizedBox(
        height: 50,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
