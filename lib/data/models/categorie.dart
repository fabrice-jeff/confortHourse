class Categorie {
  final int id;
  final String libelle;
  final String? icon;
  final int? nombreAnnonce;

  Categorie({
    required this.id,
    required this.libelle,
    this.icon,
    this.nombreAnnonce,
  });
  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
      id: json['id'],
      icon: json['icon'],
      libelle: json['libelle'],
      nombreAnnonce: json['nombre_annonces']);
}
