// Interface to define datasource function
import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/helpers/dio_helper.dart';
import 'package:tmdb_demo/core/string/constants.dart';
import 'package:tmdb_demo/core/utils/extensions.dart';
import 'package:tmdb_demo/features/details/data/models/actor.dart';
import 'package:tmdb_demo/features/details/data/models/movie_details.dart';

abstract class IDetailsDatasource {
  /// Get movie details
  Future<Either<MovieDetails, IFailure>> getMovieDetails(int movieId);

  /// Get movie details
  Future<Either<List<Actor>, IFailure>> getActors(int movieId);
}

// Interface to fetch data from remote datasource
class RemoteDetailsDatasourceImpl extends IDetailsDatasource {
  final DioHelper dio;

  RemoteDetailsDatasourceImpl(this.dio);

  @override
  Future<Either<MovieDetails, IFailure>> getMovieDetails(int movieId) async {
    final response = await dio.request<MovieDetails>(
      url: ApiConstants.MOVIE_DETAILS.format([movieId.toString()]),
      method: Method.get,
      data: null,
      converter: (response) {
        try {
          return MovieDetails.fromMap(response);
        } catch (e) {
          throw Exception(e);
        }
      },
    );
    return response;
  }

  @override
  Future<Either<List<Actor>, IFailure>> getActors(int movieId) async {
    final response = await dio.request<List<Actor>>(
      url: ApiConstants.ACTORS.format([movieId.toString()]),
      method: Method.get,
      data: null,
      converter: (response) {
        try {
          final mapList = response['cast'] as List;
          return mapList.map((e) => Actor.fromMap(e)).toList();
        } catch (e) {
          throw Exception(e);
        }
      },
    );
    return response;
  }
}
