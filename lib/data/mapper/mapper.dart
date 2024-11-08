import 'package:recipetestapp/app/constants/global_constants.dart';
import 'package:recipetestapp/data/response/responses.dart';
import 'package:recipetestapp/domain/model/models.dart';
import "package:recipetestapp/app/extensions.dart";

extension AuthenticationMapper on AuthenticationResponse? {
  Authentication get toDomain => Authentication(
        this?.userId.orMinusOne ?? Constants.minusOne,
        this?.email.orEmpty ?? Constants.empty,
        this?.password.orEmpty ?? Constants.empty,
      );
}
