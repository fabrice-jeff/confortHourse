class Location {
  final int? id;
  final String localisation;
  final String description;
  final String photo;
  final int prix;
  final String pays;
  final String type;
  final String categorie;
  final bool status;
  final bool louer;
  final DateTime date_publication;
  Location(
      {this.id,
      required this.localisation,
      required this.description,
      required this.photo,
      required this.prix,
      required this.pays,
      required this.type,
      required this.categorie,
      required this.status,
      required this.louer,
      required this.date_publication});
  factory Location.fromJson(Map<String, dynamic> json) => Location(
        localisation: json['localisation'],
        description: json['description'],
        photo: json['photo'],
        prix: json['prix'],
        pays: json['pays'],
        type: json['type'],
        categorie: json['categorie'],
        status: json['status'],
        louer: json['louer'],
        date_publication: json['date'],
      );
}
