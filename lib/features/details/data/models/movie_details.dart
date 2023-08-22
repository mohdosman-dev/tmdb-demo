// To parse this JSON data, do
//
//     final movieDetails = movieDetailsFromMap(jsonString);

import 'dart:convert';

import 'package:tmdb_demo/features/home/data/models/genre.dart';

MovieDetails movieDetailsFromMap(String str) => MovieDetails.fromMap(json.decode(str));

String movieDetailsToMap(MovieDetails data) => json.encode(data.toMap());

class MovieDetails {
    final bool? adult;
    final String? backdropPath;
    final int? budget;
    final List<Genre>? genres;
    final String? homepage;
    final int? id;
    final String? imdbId;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final DateTime? releaseDate;
    final int? revenue;
    final int? runtime;
    final String? status;
    final String? tagline;
    final String? title;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    MovieDetails({
        this.adult,
        this.backdropPath,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    MovieDetails copyWith({
        bool? adult,
        String? backdropPath,
        int? budget,
        List<Genre>? genres,
        String? homepage,
        int? id,
        String? imdbId,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        DateTime? releaseDate,
        int? revenue,
        int? runtime,
        String? status,
        String? tagline,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
    }) => 
        MovieDetails(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            budget: budget ?? this.budget,
            genres: genres ?? this.genres,
            homepage: homepage ?? this.homepage,
            id: id ?? this.id,
            imdbId: imdbId ?? this.imdbId,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            releaseDate: releaseDate ?? this.releaseDate,
            revenue: revenue ?? this.revenue,
            runtime: runtime ?? this.runtime,
            status: status ?? this.status,
            tagline: tagline ?? this.tagline,
            title: title ?? this.title,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    factory MovieDetails.fromMap(Map<String, dynamic> json) => MovieDetails(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromMap(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "budget": budget,
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toMap())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
