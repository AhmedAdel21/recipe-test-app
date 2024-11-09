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

@JsonSerializable()
class RecipeResponse {
  final String? id;
  final String? fats;
  final String? name;
  final String? time;
  final String? image;
  final List<String?> weeks;
  final String? carbos;

  @JsonKey(defaultValue: '') // Default empty string if null
  final String? fibers;

  final int? rating; // Nullable to allow null values
  final String? country;
  final int? ratings; // Nullable to allow null values
  final String? calories;
  final String? headline;
  final List<String?> keywords;
  final List<String?> products;
  final String? proteins;
  final int? favorites;
  final int? difficulty;
  final String? description;
  final bool? highlighted;
  final List<String?> ingredients;

  final dynamic incompatibilities;

  @JsonKey(name: 'deliverable_ingredients') // Map JSON key to field name
  final List<String?> deliverableIngredients;

  @JsonKey(name: 'undeliverable_ingredients') // Map JSON key to field name
  final List<String?> undeliverableIngredients;

  RecipeResponse({
    required this.id,
    required this.fats,
    required this.name,
    required this.time,
    required this.image,
    required this.weeks,
    required this.carbos,
    this.fibers = '', // Default value if not provided
    this.rating,
    required this.country,
    this.ratings,
    required this.calories,
    required this.headline,
    required this.keywords,
    required this.products,
    required this.proteins,
    required this.favorites,
    required this.difficulty,
    required this.description,
    required this.highlighted,
    required this.ingredients,
    this.incompatibilities,
    required this.deliverableIngredients,
    required this.undeliverableIngredients,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeResponseToJson(this);
}
