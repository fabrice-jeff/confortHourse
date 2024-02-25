import '../../services/datetime_format.dart';
import 'Fichier.dart';
import 'annonce.dart';

class FichierAnnonce {
  final int id;
  final String code;
  final Annonce annonce;
  final Fichier fichier;
  final DateTime createdAt;
  final DateTime updatedAt;
  const FichierAnnonce({
    required this.id,
    required this.code,
    required this.annonce,
    required this.fichier,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FichierAnnonce.fromJson(Map<String, dynamic> json) {
    Annonce annonce = Annonce.fromJson(json['annonce']);
    Fichier fichier = Fichier.fromJson(json['fichier']);

    return FichierAnnonce(
      id: json["id"],
      code: json['code'],
      annonce: annonce,
      fichier: fichier,
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']),
    );
  }
}
