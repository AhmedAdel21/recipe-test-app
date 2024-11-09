import 'package:recipetestapp/app/global_functions.dart';
import 'package:recipetestapp/data/network/rest_api/app_api.dart';
import 'package:recipetestapp/data/requests.dart';
import 'package:recipetestapp/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<List<RecipeResponse>> getRecipes();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    securePrint("loginRequest: $loginRequest");

    await Future.delayed(const Duration(seconds: 1));
    return AuthenticationResponse(1, "Ahmed", "password");
  }

  @override
  Future<List<RecipeResponse>> getRecipes() => _appServiceClient.getRecipes();
}
