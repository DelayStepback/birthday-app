// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishitem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishItemAdapter extends TypeAdapter<WishItem> {
  @override
  final int typeId = 1;

  @override
  WishItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishItem(
      title: fields[0] as String,
      link: fields[1] as String,
      selected: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WishItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.selected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
