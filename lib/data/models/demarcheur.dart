import '../../services/datetime_format.dart';
import 'pays.dart';

class Demarcheur {
  final int id;
  final String nom;
  final String prenoms;
  final String email;
  final String telephone;
  final String sexe;
  final String? description;
  final String whatsapp;
  final String ville;
  final Pays pays;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Demarcheur({
    required this.id,
    required this.nom,
    required this.prenoms,
    required this.email,
    required this.telephone,
    required this.sexe,
    required this.description,
    required this.whatsapp,
    required this.ville,
    required this.pays,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Demarcheur.fromJson(Map<String, dynamic> json) {
    Pays pays = Pays.fromJson(json['pays']);
    return Demarcheur(
      id: json['id'],
      nom: json['nom'],
      prenoms: json['prenoms'],
      email: json['email'],
      telephone: json['telephone'],
      sexe: json['sexe'],
      description: json['description'],
      whatsapp: json['whatsapp'],
      pays: pays,
      ville: json['ville'],
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']),
    );
  }
}
