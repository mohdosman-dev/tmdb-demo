// Interface to excecute functions related to home page
import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/details/data/models/actor.dart';
import 'package:tmdb_demo/features/details/data/models/movie_details.dart';

abstract class IDetailsRepository {
  /// Get movie details
  Future<Either<MovieDetails, IFailure>> getMovieDetails(int movieId);

  /// Get movie details
  Future<Either<List<Actor>, IFailure>> getActors(int movieId);
}
