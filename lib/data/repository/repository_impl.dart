import 'dart:async';

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
  StreamController<Recipe> _controller = StreamController<Recipe>();
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

        // success -- return either right, data
        final authenticationData = response.toDomain;

        DI.getItInstance<AppSharedPrefs>().setIsUserLoggedIn(true);
        DI.getItInstance<AppSharedPrefs>().setEmail(authenticationData.email);
        DI
            .getItInstance<AppSharedPrefs>()
            .setPassword(authenticationData.password);
        DI.getItInstance<AppSharedPrefs>().setUserId(authenticationData.userId);

        return Right(authenticationData);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // failure -- return either left, internet connection error
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, Recipe>>> getRecipes() async {
    if (await _networkInfo.isConnected) {
      try {
        List<RecipeResponse> response = await _remoteDataSource.getRecipes();
        // success -- return either right, data
        // List<Recipe> recipes = response.map((e) => e.toDomain).toList();

        Map<String, Recipe> recipes = Map.fromEntries(
          response.map((res) => MapEntry(res.id ?? "", res.toDomain)),
        );

        List<String> recipesMarkedAsFavorites =
            await _localDataSource.getFavoritesRecipeIds();

        for (var resId in recipesMarkedAsFavorites) {
          if (recipes[resId] != null) {
            recipes[resId] = recipes[resId]!.copyWith(isFavorite: true);
          }
        }
        // securePrint("recipes: $recipes");
        return Right(recipes);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // failure -- return either left, internet connection error
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setRecipeState(Recipe state) async {
    try {
      if (state.isFavorite ?? false) {
        await _localDataSource.saveRecipeId(state.id);
      } else {
        await _localDataSource.removeRecipeId(state.id);
      }
      _controller.add(state);
      return right(true);
    } catch (e) {
      return Left(Failure(-1, "Can not access local data base"));
    }
  }

  @override
  Stream<Recipe> get onNewRecipe => _controller.stream;
}

class RepositoryErrorCodesConstant {
  static const localDataSourceErrorCode = 5000;
}
