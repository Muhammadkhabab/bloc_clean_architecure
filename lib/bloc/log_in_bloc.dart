import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInState()) {
    on<EmailChanged>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<TogglePasswordVisibility>(_onPasswordVisibility);
    on<LogInApi>(_onSubmitted);
  }

  void _onEmailChange(EmailChanged event, Emitter<LogInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordChange event, Emitter<LogInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onPasswordVisibility(TogglePasswordVisibility event, Emitter<LogInState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onSubmitted(LogInApi event, Emitter<LogInState> emit) {}
}
