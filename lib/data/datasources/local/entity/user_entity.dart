import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String numberId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String lastName;
  @HiveField(4)
  final String? direccion;
  @HiveField(5)
  final String? telefono;

  UserEntity({
    required this.id,
    required this.numberId,
    required this.name,
    required this.lastName,
    this.direccion,
    this.telefono,
  });
}
