part of 'usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
          LoginUseCaseInput input) async =>
      _repository.login(LoginRequest(input.email, input.password));
}
