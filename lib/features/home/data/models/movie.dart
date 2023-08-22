import 'dart:convert';

import 'package:flutter/foundation.dart';

class Movie {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (adult != null) {
      result.addAll({'adult': adult});
    }
    if (backdropPath != null) {
      result.addAll({'backdropPath': backdropPath});
    }
    if (genreIds != null) {
      result.addAll({'genreIds': genreIds});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (originalLanguage != null) {
      result.addAll({'originalLanguage': originalLanguage});
    }
    if (originalTitle != null) {
      result.addAll({'originalTitle': originalTitle});
    }
    if (overview != null) {
      result.addAll({'overview': overview});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (posterPath != null) {
      result.addAll({'posterPath': posterPath});
    }
    if (releaseDate != null) {
      result.addAll({'releaseDate': releaseDate!.millisecondsSinceEpoch});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (video != null) {
      result.addAll({'video': video});
    }
    if (voteAverage != null) {
      result.addAll({'voteAverage': voteAverage});
    }
    if (voteCount != null) {
      result.addAll({'voteCount': voteCount});
    }

    return result;
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      adult: map['adult'],
      backdropPath: map['backdropPath'],
      genreIds: List<int>.from(map['genreIds']),
      id: map['id']?.toInt(),
      originalLanguage: map['originalLanguage'],
      originalTitle: map['originalTitle'],
      overview: map['overview'],
      popularity: map['popularity']?.toDouble(),
      posterPath: map['posterPath'],
      releaseDate: map['releaseDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['releaseDate'])
          : null,
      title: map['title'],
      video: map['video'],
      voteAverage:
          map['voteAverage'] != null ? map['voteAverage']?.toDouble() : 0.0,
      voteCount: map['voteCount'] != null ? map['voteCount']?.toInt() : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        listEquals(other.genreIds, genreIds) &&
        other.id == id &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        genreIds.hashCode ^
        id.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        releaseDate.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}
