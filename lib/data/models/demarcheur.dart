class Demarcheur {
  final int? id;
  final String nom;
  final String prenoms;
  final String ville;
  final String sexe;
  final String pays;
  final String telephone;
  final String email;
  final String whatsapp;
  final String password;
  final String? photo;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Demarcheur({
    this.id,
    required this.nom,
    required this.prenoms,
    required this.ville,
    required this.pays,
    required this.sexe,
    required this.telephone,
    required this.email,
    required this.whatsapp,
    required this.password,
    this.photo,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  // Transformation  de JSON en Objet Demacheur
  factory Demarcheur.fromJson(json) => Demarcheur(
        id: json['id'],
        nom: json['nom'],
        prenoms: json['prenoms'],
        ville: json['ville'],
        sexe: json['sexe'],
        pays: json['pays'],
        telephone: json['telephone'],
        email: json['email'],
        whatsapp: json['whatsapp'],
        password: json['password'],
        description: json['description'],
        photo: json['photo'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  // Conversion  de l'instance Demarcheur ver un objet JSON
  Map<String, dynamic> toJson() => {
        'nom': this.nom,
        'prenoms': this.prenoms,
        'sexe': this.sexe,
        'ville': this.ville,
        'pays': this.pays,
        'telephone': this.telephone,
        'whatsapp': this.whatsapp,
        'email': this.email,
        'password': this.password,
        // "description": this.description,
        // "photo": this.photo,
      };
}
