class TypeAnnonce {
  final int id;
  final String libelle;
  const TypeAnnonce({
    required this.id,
    required this.libelle,
  });

  factory TypeAnnonce.fromJson(Map<String, dynamic> json) {
    return TypeAnnonce(
      id: json['id'],
      libelle: json['libelle'],
    );
  }
}
