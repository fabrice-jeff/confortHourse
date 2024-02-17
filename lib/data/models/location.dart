class Location {
  final int id;
  final String code;
  final String localisation;
  final String description;
  final String photo;
  final int prix;
  final String pays;
  final String type;
  final int idCategorie;
  final String categorie;
  final bool status;
  final bool louer;
  final DateTime? date_publication;
  Location({
    required this.id,
    required this.code,
    required this.localisation,
    required this.description,
    required this.photo,
    required this.prix,
    required this.pays,
    required this.type,
    required this.categorie,
    required this.status,
    required this.louer,
    required this.idCategorie,
    this.date_publication,
  });
  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json['id'],
        code: json['code'],
        localisation: json['localisation'],
        description: json['description'],
        photo: json['photo'],
        prix: json['prix'],
        pays: json['pays'],
        type: json['type'],
        categorie: json['categorie'],
        status: (json['status'] == 1) ? true : false,
        louer: (json['louer'] == 1) ? true : false,
        idCategorie: json['id_categorie'],
        date_publication: json['save_date'],
      );
}
