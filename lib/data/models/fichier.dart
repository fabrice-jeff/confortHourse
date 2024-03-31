class Fichier {
  final int id;
  final String path;

  Fichier({
    required this.id,
    required this.path,
  });
  factory Fichier.fromJson(Map<String, dynamic> json) =>
      Fichier(id: json['id'], path: json['path']);
}
