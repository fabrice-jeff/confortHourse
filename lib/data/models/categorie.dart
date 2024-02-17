class Categorie {
  final int id;
  final int nombreLocation;
  final String icon;
  final String titre;

  Categorie({
    required this.id,
    required this.titre,
    required this.icon,
    required this.nombreLocation,
  });
  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
        id: json['categorie_id'],
        titre: json['name'],
        icon: json['icon'],
        nombreLocation: json['nombre_location'],
      );
}
