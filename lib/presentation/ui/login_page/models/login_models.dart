import 'package:formz/formz.dart';

class LoginForm with FormzMixin {
  LoginForm({
    this.username = const Email.pure(),
    this.password = const Password.pure(),
  });

  final Email username;
  final Password password;

  @override
  List<FormzInput> get inputs => [username, password];
}

enum EmailValidationError {
  empty('Please enter an email'),
  invalid('Please ensure the email entered is valid');

  final String _errorMessage;
  const EmailValidationError(this._errorMessage);

  String get getErrorMessage => _errorMessage;
}

enum PasswordValidationError {
  empty('Please enter a password'),
  invalid(
      'Password must be at least 8 characters and contain at least one letter and number');

  final String _errorMessage;
  const PasswordValidationError(this._errorMessage);

  String get getErrorMessage => _errorMessage;
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;

    if (!_emailRegExp.hasMatch(value)) return EmailValidationError.invalid;

    return null;
  }
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;

    if (!_passwordRegex.hasMatch(value)) return PasswordValidationError.invalid;

    return null;
  }
}
