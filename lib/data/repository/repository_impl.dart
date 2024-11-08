import 'package:recipetestapp/app/di.dart';
import 'package:recipetestapp/data/data_source/local_data_source/local_data_source.dart';
import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/app_cache.dart';
import 'package:recipetestapp/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:recipetestapp/data/mapper/mapper.dart';
import 'package:recipetestapp/data/network/error_handler.dart';
import 'package:recipetestapp/data/network/network_info.dart';
import 'package:recipetestapp/data/requests.dart';
import 'package:recipetestapp/app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:recipetestapp/data/response/responses.dart';
import 'package:recipetestapp/domain/model/models.dart';
import 'package:recipetestapp/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(
      this._localDataSource, this._remoteDataSource, this._networkInfo);

  @override
  Future<void> initRepo() async {
    await _localDataSource.initLocalDataSource();
  }

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        AuthenticationResponse response =
            await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.success) {
          // success -- return either right, data
          final authenticationData = response.toDomain;

          DI.getItInstance<AppSharedPrefs>().setIsUserLoggedIn(true);
          DI
              .getItInstance<AppSharedPrefs>()
              .setEmail(authenticationData.userName);
          DI
              .getItInstance<AppSharedPrefs>()
              .setPassword(authenticationData.password);

          return Right(authenticationData);
        } else {
          // failure  -- return either left, business error
          return Left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.none));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // failure -- return either left, internet connection error
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}

class RepositoryErrorCodesConstant {
  static const localDataSourceErrorCode = 5000;
}