part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LogInEvent {
  final String email;
  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChange extends LogInEvent {
  final String password;
  const PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];
}

class TogglePasswordVisibility extends LogInEvent{}

class LogInApi extends LogInEvent {
  const LogInApi();
}
