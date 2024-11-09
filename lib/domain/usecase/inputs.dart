part of 'usecase.dart';

class LoginUseCaseInput extends Equatable {
  final String email;
  final String password;
  const LoginUseCaseInput(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
