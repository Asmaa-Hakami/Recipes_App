// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveRecipeAdapter extends TypeAdapter<HiveRecipe> {
  @override
  final int typeId = 0;

  @override
  HiveRecipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveRecipe(
      id: fields[0] as int?,
      name: fields[1] as String?,
      image: fields[2] as String?,
      rating: fields[3] as num?,
      ingredients: (fields[4] as List?)?.cast<dynamic>(),
      instructions: fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, HiveRecipe obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.ingredients)
      ..writeByte(5)
      ..write(obj.instructions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveRecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
