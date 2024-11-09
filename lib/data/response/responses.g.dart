// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      (json['userId'] as num?)?.toInt(),
      json['email'] as String?,
      json['password'] as String?,
    );

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'password': instance.password,
    };

RecipeResponse _$RecipeResponseFromJson(Map<String, dynamic> json) =>
    RecipeResponse(
      id: json['id'] as String?,
      fats: json['fats'] as String?,
      name: json['name'] as String?,
      time: json['time'] as String?,
      image: json['image'] as String?,
      weeks: (json['weeks'] as List<dynamic>).map((e) => e as String?).toList(),
      carbos: json['carbos'] as String?,
      fibers: json['fibers'] as String? ?? '',
      rating: (json['rating'] as num?)?.toInt(),
      country: json['country'] as String?,
      ratings: (json['ratings'] as num?)?.toInt(),
      calories: json['calories'] as String?,
      headline: json['headline'] as String?,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String?).toList(),
      products:
          (json['products'] as List<dynamic>).map((e) => e as String?).toList(),
      proteins: json['proteins'] as String?,
      favorites: (json['favorites'] as num?)?.toInt(),
      difficulty: (json['difficulty'] as num?)?.toInt(),
      description: json['description'] as String?,
      highlighted: json['highlighted'] as bool?,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      incompatibilities: json['incompatibilities'],
      deliverableIngredients: (json['deliverable_ingredients'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      undeliverableIngredients:
          (json['undeliverable_ingredients'] as List<dynamic>)
              .map((e) => e as String?)
              .toList(),
    );

Map<String, dynamic> _$RecipeResponseToJson(RecipeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fats': instance.fats,
      'name': instance.name,
      'time': instance.time,
      'image': instance.image,
      'weeks': instance.weeks,
      'carbos': instance.carbos,
      'fibers': instance.fibers,
      'rating': instance.rating,
      'country': instance.country,
      'ratings': instance.ratings,
      'calories': instance.calories,
      'headline': instance.headline,
      'keywords': instance.keywords,
      'products': instance.products,
      'proteins': instance.proteins,
      'favorites': instance.favorites,
      'difficulty': instance.difficulty,
      'description': instance.description,
      'highlighted': instance.highlighted,
      'ingredients': instance.ingredients,
      'incompatibilities': instance.incompatibilities,
      'deliverable_ingredients': instance.deliverableIngredients,
      'undeliverable_ingredients': instance.undeliverableIngredients,
    };
