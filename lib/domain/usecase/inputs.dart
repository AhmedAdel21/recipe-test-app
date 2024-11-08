part of 'usecase.dart';

class LoginUseCaseInput extends Equatable {
  final String userName;
  final String password;
  const LoginUseCaseInput(this.userName, this.password);

  @override
  List<Object?> get props => [userName, password];
}
