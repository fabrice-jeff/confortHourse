import 'package:flutter/material.dart';

class Categorie {
  final int nombreLocation;
  final IconData icon;
  final String titre;

  Categorie({
    required this.titre,
    required this.icon,
    required this.nombreLocation,
  });
  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
        titre: json['titre'],
        icon: json['icon'],
        nombreLocation: json['nombre'],
      );
}
