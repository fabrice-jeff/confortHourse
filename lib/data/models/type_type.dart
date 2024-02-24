import '../../services/datetime_format.dart';

class TypeType {
  final int id;
  final String code;
  final String libelle;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  TypeType({
    required this.id,
    required this.code,
    required this.libelle,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });
  factory TypeType.fromJson(Map<String, dynamic> json) => TypeType(
      id: json['id'],
      code: json['code'],
      libelle: json['libelle'],
      deleted: (json['deleted'] == 0) ? false : true,
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']));
}
