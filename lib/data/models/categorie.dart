import '../../services/datetime_format.dart';

class Categorie {
  final int id;
  final String libelle;
  final String? icon;
  final DateTime createdAt;
  final DateTime updatedAt;

  Categorie({
    required this.id,
    required this.libelle,
    this.icon,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
      id: json['id'],
      icon: json['icon'],
      libelle: json['libelle'],
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']));
}
