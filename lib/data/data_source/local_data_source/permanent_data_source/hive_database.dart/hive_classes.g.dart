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
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
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

class RecipeEntitiesContainerAdapter
    extends TypeAdapter<RecipeEntitiesContainer> {
  @override
  final int typeId = 1;

  @override
  RecipeEntitiesContainer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeEntitiesContainer()
      ..recipeEntities = (fields[0] as Map).cast<String, String>();
  }

  @override
  void write(BinaryWriter writer, RecipeEntitiesContainer obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recipeEntities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeEntitiesContainerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
