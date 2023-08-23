import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/utils/base_usecase.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';
import 'package:tmdb_demo/features/search/domain/repositories/i_search_repository.dart';

class SearchForAMovieUsecase
    extends BaseUseCase<List<Movie>, Map<String, dynamic>> {
  final ISearchRepository repository;

  SearchForAMovieUsecase(this.repository);
  @override
  Future<Either<List<Movie>, IFailure>> call(Map<String, dynamic> params) {
    return repository.search(params);
  }
}
