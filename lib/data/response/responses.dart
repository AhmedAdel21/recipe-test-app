// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  AuthenticationResponse(this.userId, this.email, this.password);

  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
