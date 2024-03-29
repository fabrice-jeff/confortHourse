class TypeAnnonce {
  final int id;
  final String codeReference;
  final String libelle;
  const TypeAnnonce({
    required this.id,
    required this.codeReference,
    required this.libelle,
  });

  factory TypeAnnonce.fromJson(Map<String, dynamic> json) {
    return TypeAnnonce(
      id: json['id'],
      codeReference: json['code_reference'],
      libelle: json['libelle'],
    );
  }
}
