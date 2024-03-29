class Pays {
  final int id;
  final String libelle;
  const Pays({
    required this.id,
    required this.libelle,
  });

  factory Pays.fromJson(Map<String, dynamic> json) {
    return Pays(
      id: json['id'],
      libelle: json['libelle'],
    );
  }
}
