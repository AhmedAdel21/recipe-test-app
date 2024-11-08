import 'package:dartz/dartz.dart';
import 'package:recipetestapp/app/error/failure.dart';
import 'package:recipetestapp/data/requests.dart';
import 'package:recipetestapp/domain/model/models.dart';

abstract class Repository {
  Future<void> initRepo();
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
