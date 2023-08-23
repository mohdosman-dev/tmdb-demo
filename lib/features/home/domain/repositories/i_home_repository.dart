// Interface to excecute functions related to home page
import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/home/data/models/genre.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

abstract class IHomeRepository {
  /// Get popular movies
  Future<Either<List<Movie>, IFailure>> getPopularMovies(Map<String, dynamic> params);

  /// Get upcoming movies
  Future<Either<List<Movie>, IFailure>> getUpcomingMovies(Map<String, dynamic> params);

  /// Get genre
  Future<Either<List<Genre>, IFailure>> getGenres();
}
