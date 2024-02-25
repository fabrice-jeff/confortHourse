import '../../services/datetime_format.dart';
import 'categorie.dart';
import 'type_type.dart';
import 'ville.dart';

class Annonce {
  final int id;
  final String code;
  final String titre;
  final String description;
  final String prix;
  final bool deleted;
  final Ville ville;
  final Categorie categorie;
  final TypeType typeAnnonce;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Annonce(
      {required this.id,
      required this.titre,
      required this.code,
      required this.description,
      required this.prix,
      required this.deleted,
      required this.ville,
      required this.categorie,
      required this.typeAnnonce,
      required this.createdAt,
      required this.updatedAt});
  factory Annonce.fromJson(Map<String, dynamic> json) {
    Ville ville = Ville.fromJson(json['ville']);
    Categorie categorie = Categorie.fromJson(json['categorie']);
    TypeType typeAnnonce = TypeType.fromJson(json['type_annonce']);

    return Annonce(
      id: json['id'],
      titre: json['titre'],
      code: json['code'],
      description: json['descrpition'],
      prix: json['prix'].toString(),
      deleted: (json['deleted'] == 0) ? false : true,
      ville: ville,
      categorie: categorie,
      typeAnnonce: typeAnnonce,
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']),
    );
  }
}
