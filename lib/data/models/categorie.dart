import '../../services/datetime_format.dart';

class Categorie {
  final int id;
  final String code;
  final String libelle;
  final String? icon;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? nombreAnnonce;

  Categorie({
    required this.id,
    required this.code,
    required this.libelle,
    this.icon,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    this.nombreAnnonce,
  });
  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
      id: json['id'],
      code: json['code'],
      icon: json['icon'],
      libelle: json['libelle'],
      deleted: (json['deleted'] == 0) ? false : true,
      nombreAnnonce: json['nombre_annonce'],
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']));
}
