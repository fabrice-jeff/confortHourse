import '../../services/datetime_format.dart';
import 'pays.dart';

class Ville {
  final int id;
  final String code;
  final String libelle;
  final Pays pays;
  final bool deleted;
  // final User createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Ville({
    required this.id,
    required this.code,
    required this.libelle,
    required this.pays,
    required this.deleted,
    // required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Ville.fromJson(Map<String, dynamic> json) {
    Pays pays = Pays.fromJson(json['pays']);
    // User createdBy = User.fromJson(json['created_by']);
    return Ville(
        id: json['id'],
        code: json['code'],
        libelle: json['libelle'],
        pays: pays,
        deleted: (json['deleted'] == 0) ? false : true,
        // createdBy: createdBy,
        createdAt: dateTimeFormat(json['created_at']),
        updatedAt: dateTimeFormat(json['updated_at']));
  }
}
