import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'models.freezed.dart';

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

enum Difficulty {
  easy(0, "Easy"),
  medium(1, "Medium"),
  hard(2, "Hard"),
  none(-1, "Not found"),
  ;

  final String text;
  final int code;
  const Difficulty(this.code, this.text);

  factory Difficulty.fromCode(int jsonCode) =>
      values.firstWhere((dif) => dif.code == jsonCode, orElse: () => none);
}

@freezed
class Recipe with _$Recipe {
  // final String id;
  // final String fats;
  // final String name;
  // final String time;
  // final String image;
  // final List<String> weeks;
  // final String carbos;
  // final String fibers;
  // final int rating;
  // final String country;
  // final int ratings;
  // final String calories;
  // final String headline;
  // final List<String> keywords;
  // final List<String> products;
  // final String proteins;
  // final int favorites;
  // final Difficulty difficulty;
  // final String description;
  // final bool highlighted;
  // final List<String> ingredients;
  // final dynamic incompatibilities;
  // final List<String> deliverableIngredients;
  // final List<String> undeliverableIngredients;
  // bool isFavorite;
  const factory Recipe({
    required String id,
    required String fats,
    required String name,
    required String time,
    required String image,
    required List<String> weeks,
    required String carbos,
    required String fibers,
    required int rating,
    required String country,
    required int ratings,
    required String calories,
    required String headline,
    required List<String> keywords,
    required List<String> products,
    required String proteins,
    required int favorites,
    required Difficulty difficulty,
    required String description,
    required bool highlighted,
    required List<String> ingredients,
    required dynamic incompatibilities,
    required List<String> deliverableIngredients,
    required List<String> undeliverableIngredients,
    bool? isFavorite,
  }) = _Recipe;

//  factory const Recipe({
//     this.isFavorite = false,
//     required this.id,
//     required this.fats,
//     required this.name,
//     required this.time,
//     required this.image,
//     required this.weeks,
//     required this.carbos,
//     required this.fibers,
//     required this.rating,
//     required this.country,
//     required this.ratings,
//     required this.calories,
//     required this.headline,
//     required this.keywords,
//     required this.products,
//     required this.proteins,
//     required this.favorites,
//     required this.difficulty,
//     required this.description,
//     required this.highlighted,
//     required this.ingredients,
//     required this.incompatibilities,
//     required this.deliverableIngredients,
//     required this.undeliverableIngredients,
//   })= _Recipe;
  // @override
  // List<Object?> get props => [
  //       isFavorite,
  //       id,
  //       fats,
  //       name,
  //       time,
  //       image,
  //       weeks,
  //       carbos,
  //       fibers,
  //       rating,
  //       country,
  //       ratings,
  //       calories,
  //       headline,
  //       keywords,
  //       products,
  //       proteins,
  //       favorites,
  //       difficulty,
  //       description,
  //       highlighted,
  //       ingredients,
  //       incompatibilities,
  //       deliverableIngredients,
  //       undeliverableIngredients,
  //     ];
}
