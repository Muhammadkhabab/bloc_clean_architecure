import 'package:clean_code_bloc/bloc/log_in_bloc.dart';
import 'package:clean_code_bloc/view/auth/login/widgets/email_input_widget.dart';
import 'package:clean_code_bloc/view/auth/login/widgets/forgot_password.dart';
import 'package:clean_code_bloc/view/auth/login/widgets/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/components/buttons/custom_elevated_button.dart';
import '../../../config/colors/app_colors.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  late LogInBloc _logInBloc;
  final _logInformKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _logInBloc = LogInBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _logInBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _logInBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _logInformKey,
              child: Column(
                children: [
                  Text('Sign In', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 68),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        EmailInputWidget(),
                        const SizedBox(height: 16),
                        PasswordInputWidget(),
                        ForgotPassword(),
                        const SizedBox(height: 24),
                        CustomButton(
                          onPressed: () {
                            // if (_logInformKey.currentState?.validate() ?? false) {
                            //   logInBloc.add(LoginSubmitted()); // ✅ Dispatch event
                            // }
                          },
                          textColor: Colors.white,
                          backgroundColor: AppColors.primaryColor,
                          label: 'Login',
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
