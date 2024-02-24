import '../../services/datetime_format.dart';
import 'user.dart';
import 'ville.dart';

class Demarcheur {
  final int id;
  final String code;
  final String nom;
  final String prenoms;
  final String email;
  final String telephone;
  final String sexe;
  final String description;
  final String whatsapp;
  final bool deleted;
  final Ville ville;
  final User user;
  final User? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Demarcheur({
    required this.id,
    required this.code,
    required this.nom,
    required this.prenoms,
    required this.email,
    required this.telephone,
    required this.sexe,
    required this.description,
    required this.whatsapp,
    required this.deleted,
    required this.ville,
    required this.user,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Demarcheur.fromJson(Map<String, dynamic> json) {
    Ville ville = Ville.fromJson(json['ville']);
    User user = User.fromJson(json['user']);
    return Demarcheur(
      id: json['id'],
      code: json['code'],
      nom: json['nom'],
      prenoms: json['prenoms'],
      email: json['email'],
      telephone: json['telephone'],
      sexe: json['sexe'],
      description: json['description'],
      whatsapp: json['whatsapp'],
      deleted: (json['deleted'] == 0) ? false : true,
      ville: ville,
      user: user,
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']),
    );
  }
}
