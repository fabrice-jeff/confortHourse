import '../../services/datetime_format.dart';
import 'categorie.dart';
import 'type_annonce.dart';

class Annonce {
  final int id;
  final String titre;
  final String description;
  final String prix;
  final String ville;
  final Categorie categorie;
  final TypeAnnonce typeAnnonce;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Annonce(
      {required this.id,
      required this.titre,
      required this.description,
      required this.prix,
      required this.ville,
      required this.categorie,
      required this.typeAnnonce,
      required this.createdAt,
      required this.updatedAt});
  factory Annonce.fromJson(Map<String, dynamic> json) {
    Categorie categorie = Categorie.fromJson(json['categorie']);
    TypeAnnonce typeAnnonce = TypeAnnonce.fromJson(json['type_annonce']);
    return Annonce(
      id: json['id'],
      titre: json['titre'],
      description: json['descrpition'],
      prix: json['prix'].toString(),
      ville: json['ville'],
      categorie: categorie,
      typeAnnonce: typeAnnonce,
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']),
    );
  }
}
