part of 'log_in_bloc.dart';

class LogInState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;

  const LogInState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
  });

  LogInState copyWith({
    final String? email,
    final String? password,
    final bool? isPasswordVisible,
  }) {
    return LogInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, isPasswordVisible];
}
