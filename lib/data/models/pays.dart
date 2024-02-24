import '../../services/datetime_format.dart';
import 'user.dart';

class Pays {
  final int id;
  final String code;
  final String libelle;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  // final User createdBy;

  const Pays({
    required this.id,
    required this.code,
    required this.libelle,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    // required this.createdBy,
  });
  factory Pays.fromJson(Map<String, dynamic> json) {
    // User createdBy = User.fromJson(json['created_by']);

    return Pays(
      id: json['id'],
      code: json['code'],
      libelle: json['libelle'],
      deleted: (json['deleted'] == 0) ? false : true,
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']),
      // createdBy: createdBy,
    );
  }
}
