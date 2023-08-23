import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

abstract class ISearchRepository {
  Future<Either<List<Movie>, IFailure>> search(Map<String, dynamic> params);
}
