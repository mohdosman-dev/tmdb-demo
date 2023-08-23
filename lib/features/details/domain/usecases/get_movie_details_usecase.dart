import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/utils/base_usecase.dart';
import 'package:tmdb_demo/features/details/data/models/movie_details.dart';
import 'package:tmdb_demo/features/details/domain/repositories/i_details_repository.dart';

class GetMovieDetailsUsecase extends BaseUseCase<MovieDetails, int> {
  final IDetailsRepository repository;

  GetMovieDetailsUsecase(this.repository);
  @override
  Future<Either<MovieDetails, IFailure>> call(int params) {
    return repository.getMovieDetails(params);
  }
}
