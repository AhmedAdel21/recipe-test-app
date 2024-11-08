import 'package:recipetestapp/data/network/rest_api/app_api.dart';
import 'package:recipetestapp/data/requests.dart';
import 'package:recipetestapp/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(seconds: 2));
    return AuthenticationResponse(1, "Ahmed", "password");
  }
}
