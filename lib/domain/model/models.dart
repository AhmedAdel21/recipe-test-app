import 'package:equatable/equatable.dart';

class Authentication extends Equatable {
  final int userId;
  final String email;
  final String password;
  const Authentication(this.userId, this.email, this.password);

  @override
  List<Object?> get props => [
        userId,
        email,
        password,
      ];
}
