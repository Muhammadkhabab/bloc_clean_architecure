import 'package:clean_code_bloc/bloc/log_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/components/text_fields/custom_text_fields.dart';

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
      buildWhen: (current, previous) => previous.isPasswordVisible != current.isPasswordVisible,
      builder: (context, state) {
        print('build passs');
        return CustomTextField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          hint: 'Enter your password',
          label: 'Password',
          obscureText: !state.isPasswordVisible,
          onChanged: (value) {
            print(value);
            context.read<LogInBloc>().add(PasswordChange(password: value));
          },
          prefixIcon: Icon(
            Icons.lock_outline,
            color: AppColors.iconColor,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          suffixIcon: IconButton(
            icon: state.isPasswordVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off_sharp),
            onPressed: () {
              context.read<LogInBloc>().add(TogglePasswordVisibility());
            },
          ),
        );
      },
    );
  }
}
