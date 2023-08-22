import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/utils/base_usecase.dart';
import 'package:tmdb_demo/features/details/data/models/actor.dart';
import 'package:tmdb_demo/features/details/domain/repositories/i_details_repository.dart';

class GetMovieActorsUsecase extends BaseUseCase<List<Actor>, int> {
  final IDetailsRepository repository;

  GetMovieActorsUsecase(this.repository);

  @override
  Future<Either<List<Actor>, IFailure>> call(int params) {
    return repository.getActors(params);
  }
}
