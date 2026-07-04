import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class AnnonceModel {
  final String id;
  final String title;
  final String description;
  final String race;
  final double poids;
  final String prix;
  final String region;
  final List<String> photos;
  final String statut;
  final String eleveurId;
  final DateTime createdAt;

  const AnnonceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.race,
    required this.poids,
    required this.prix,
    required this.region,
    required this.photos,
    required this.statut,
    required this.eleveurId,
    required this.createdAt,
  });
}
