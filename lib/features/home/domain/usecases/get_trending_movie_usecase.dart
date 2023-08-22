
// Get all genres
import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/utils/base_usecase.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';
import 'package:tmdb_demo/features/home/domain/repositories/i_home_repository.dart';

class GetTrendingMoviesUsecase extends BaseUseCase<List<Movie>, Map<String, dynamic>> {
  /// Inject repository
  final IHomeRepository repository;

  GetTrendingMoviesUsecase(this.repository);

  @override
  Future<Either<List<Movie>, IFailure>> call(Map<String, dynamic> params) {
    return repository.getPopularMovies(params);
  }
}
