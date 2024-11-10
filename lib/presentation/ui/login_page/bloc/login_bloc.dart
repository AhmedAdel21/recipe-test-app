import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:recipetestapp/app/di.dart';
import 'package:recipetestapp/domain/usecase/usecase.dart';
import 'package:recipetestapp/presentation/ui/login_page/models/login_models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmit>(_onSubmit);
  }
  bool _processRequest = false;

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(email: email),
    );
  }

  void _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(password: password),
    );
  }

  void _onSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    if (state.isValid) {
      emit(
        state.copyWith(status: FormzSubmissionStatus.inProgress),
      );
      if (!_processRequest) {
        _processRequest = true;

        (await DI.getItInstance<LoginUseCase>().execute(
                LoginUseCaseInput(state.email.value, state.password.value)))
            .fold((left) {
          _processRequest = false;
          emit(
            state.copyWith(
                status: FormzSubmissionStatus.failure,
                errorMessage: left.message),
          );
        }, (right) {
          _processRequest = false;
          emit(
            state.copyWith(status: FormzSubmissionStatus.success),
          );
        });
      }
    }
  }
}
