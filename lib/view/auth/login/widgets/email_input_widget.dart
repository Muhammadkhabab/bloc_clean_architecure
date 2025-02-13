import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/log_in_bloc.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../config/components/text_fields/custom_text_fields.dart';

class EmailInputWidget extends StatefulWidget {
  const EmailInputWidget({super.key});

  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
      buildWhen: (current, previous) => false,
      builder: (context, state) {
        print('build email');
        return CustomTextField(
          controller: emailController,
          focusNode: emailFocusNode,
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            CupertinoIcons.envelope,
            color: AppColors.iconColor,
          ),
          onChanged: (value) {
            print(value);
            context.read<LogInBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          // onFieldSubmitted: (_) {
          //   FocusScope.of(context).requestFocus(emailFocusNode);
          // },
          label: 'Email',
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
