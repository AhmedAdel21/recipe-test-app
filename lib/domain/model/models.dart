import 'package:equatable/equatable.dart';

class Authentication extends Equatable {
  final int userId;
  final String userName;
  final String password;
  const Authentication(this.userId, this.userName, this.password);

  @override
  List<Object?> get props => [
        userId,
        userName,
        password,
      ];
}
