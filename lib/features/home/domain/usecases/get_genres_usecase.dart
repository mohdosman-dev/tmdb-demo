import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/utils/base_usecase.dart';
import 'package:tmdb_demo/features/home/data/models/genre.dart';
import 'package:tmdb_demo/features/home/domain/repositories/i_home_repository.dart';

// Get all genres
class GetGenresUsecase extends BaseUseCase<List<Genre>, NoParams> {
  /// Inject repository
  final IHomeRepository repository;

  GetGenresUsecase(this.repository);

  @override
  Future<Either<List<Genre>, IFailure>> call([NoParams? params]) {
    return repository.getGenres();
  }
}
