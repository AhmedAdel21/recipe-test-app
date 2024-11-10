// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_classes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeEntityAdapter extends TypeAdapter<RecipeEntity> {
  @override
  final int typeId = 0;

  @override
  RecipeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeEntity(
      isFavorite: fields[24] as bool,
      id: fields[0] as String,
      fats: fields[1] as String,
      name: fields[2] as String,
      time: fields[3] as String,
      image: fields[4] as String,
      weeks: (fields[5] as List).cast<String>(),
      carbos: fields[6] as String,
      fibers: fields[7] as String,
      rating: fields[8] as int,
      country: fields[9] as String,
      ratings: fields[10] as int,
      calories: fields[11] as String,
      headline: fields[12] as String,
      keywords: (fields[13] as List).cast<String>(),
      products: (fields[14] as List).cast<String>(),
      proteins: fields[15] as String,
      favorites: fields[16] as int,
      difficulty: fields[17] as int,
      description: fields[18] as String,
      highlighted: fields[19] as bool,
      ingredients: (fields[20] as List).cast<String>(),
      incompatibilities: fields[21] as dynamic,
      deliverableIngredients: (fields[22] as List).cast<String>(),
      undeliverableIngredients: (fields[23] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeEntity obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fats)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.weeks)
      ..writeByte(6)
      ..write(obj.carbos)
      ..writeByte(7)
      ..write(obj.fibers)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.country)
      ..writeByte(10)
      ..write(obj.ratings)
      ..writeByte(11)
      ..write(obj.calories)
      ..writeByte(12)
      ..write(obj.headline)
      ..writeByte(13)
      ..write(obj.keywords)
      ..writeByte(14)
      ..write(obj.products)
      ..writeByte(15)
      ..write(obj.proteins)
      ..writeByte(16)
      ..write(obj.favorites)
      ..writeByte(17)
      ..write(obj.difficulty)
      ..writeByte(18)
      ..write(obj.description)
      ..writeByte(19)
      ..write(obj.highlighted)
      ..writeByte(20)
      ..write(obj.ingredients)
      ..writeByte(21)
      ..write(obj.incompatibilities)
      ..writeByte(22)
      ..write(obj.deliverableIngredients)
      ..writeByte(23)
      ..write(obj.undeliverableIngredients)
      ..writeByte(24)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecipeEntityManagerAdapter extends TypeAdapter<RecipeEntityManager> {
  @override
  final int typeId = 1;

  @override
  RecipeEntityManager read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeEntityManager()
      ..RecipeEntities = (fields[0] as Map).cast<String, RecipeEntity>();
  }

  @override
  void write(BinaryWriter writer, RecipeEntityManager obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.RecipeEntities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeEntityManagerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
