part of 'login_bloc.dart';

final class LoginState extends Equatable with FormzMixin {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage = "",
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final String errorMessage;
  LoginState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Password? password,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<FormzInput> get inputs => [email, password];

  @override
  List<Object> get props => [status, email, password, errorMessage];
}
