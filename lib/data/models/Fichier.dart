import '../../services/datetime_format.dart';

class Fichier {
  final int id;
  final String code;
  final String path;
  final String extension;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Fichier({
    required this.id,
    required this.code,
    required this.path,
    required this.extension,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Fichier.fromJson(Map<String, dynamic> json) {
    return Fichier(
      id: json['id'],
      code: json['code'],
      path: json['path'],
      extension: json['extension'],
      deleted: (json['deleted'] == 0) ? false : true,
      createdAt: dateTimeFormat(json['created_at']),
      updatedAt: dateTimeFormat(json['updated_at']),
    );
  }
}

	// 1	id Primaire	bigint(20)		UNSIGNED	Non	Aucun(e)		AUTO_INCREMENT	Modifier Modifier	Supprimer Supprimer	
	// 2	code	varchar(255)	utf8mb4_unicode_ci		Non	Aucun(e)			Modifier Modifier	Supprimer Supprimer	
	// 3	path	varchar(255)	utf8mb4_unicode_ci		Non	Aucun(e)			Modifier Modifier	Supprimer Supprimer	
	// 4	extension	varchar(255)	utf8mb4_unicode_ci		Non	Aucun(e)			Modifier Modifier	Supprimer Supprimer	
	// 5	deleted	tinyint(1)			Non	Aucun(e)			Modifier Modifier	Supprimer Supprimer	
	// 6	created_at	timestamp			Oui	NULL			Modifier Modifier	Supprimer Supprimer	
	// 7	updated_at	timestamp	