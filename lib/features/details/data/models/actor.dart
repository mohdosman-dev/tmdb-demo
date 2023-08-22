// To parse this JSON data, do
//
//     final actor = actorFromMap(jsonString);

import 'dart:convert';

Actor actorFromMap(String str) => Actor.fromMap(json.decode(str));

String actorToMap(Actor data) => json.encode(data.toMap());

class Actor {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Actor copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    int? castId,
    String? character,
    String? creditId,
    int? order,
  }) =>
      Actor(
        adult: adult ?? this.adult,
        gender: gender ?? this.gender,
        id: id ?? this.id,
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        name: name ?? this.name,
        originalName: originalName ?? this.originalName,
        popularity: popularity ?? this.popularity,
        profilePath: profilePath ?? this.profilePath,
        castId: castId ?? this.castId,
        character: character ?? this.character,
        creditId: creditId ?? this.creditId,
        order: order ?? this.order,
      );

  factory Actor.fromMap(Map<String, dynamic> json) => Actor(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
      };
}
