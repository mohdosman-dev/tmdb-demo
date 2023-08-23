// Interface to define datasource function
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/helpers/dio_helper.dart';
import 'package:tmdb_demo/core/string/constants.dart';
import 'package:tmdb_demo/features/home/data/models/genre.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

abstract class IHomeDatasource {
  /// Get popular movies
  Future<Either<List<Movie>, IFailure>> getPopularMovies(
      Map<String, dynamic> params);

  /// Get upcoming movies
  Future<Either<List<Movie>, IFailure>> getUpcomingMovies(
      Map<String, dynamic> params);

  /// Get genre
  Future<Either<List<Genre>, IFailure>> getGenres();
}

// Interface to fetch data from remote datasource
class RemoteHomeDatasourceImpl extends IHomeDatasource {
  final DioHelper dio;

  RemoteHomeDatasourceImpl(this.dio);

  @override
  Future<Either<List<Genre>, IFailure>> getGenres() async {
    final response = await dio.request<List<Genre>>(
      url: ApiConstants.GENRE,
      method: Method.get,
      data: null,
      converter: (response) {
        try {
          final mapList = response['genres'] as List;
          return mapList.map((e) => Genre.fromMap(e)).toList();
        } catch (e) {
          throw Exception(e);
        }
      },
    );
    return response;
  }

  /// [params] query parameters
  @override
  Future<Either<List<Movie>, IFailure>> getPopularMovies(
      Map<String, dynamic> params) async {
    final response = await dio.request<List<Movie>>(
      url: ApiConstants.POPULAR_MOVIES,
      method: Method.get,
      data: params,
      converter: (response) {
        try {
          final mapList = response['results'] as List;
          return mapList.map((e) => Movie.fromMap(e)).toList();
        } catch (e) {
          throw Exception(e);
        }
      },
    );
    return response;
  }

  @override
  Future<Either<List<Movie>, IFailure>> getUpcomingMovies(
      Map<String, dynamic> params) async {
    log('Get Upcoming: $params');
    final response = await dio.request<List<Movie>>(
      url: ApiConstants.UPCONING_MOVIES,
      method: Method.get,
      data: params,
      converter: (response) {
        try {
          final mapList = response['results'] as List;
          return mapList.map((e) => Movie.fromMap(e)).toList();
        } catch (e) {
          throw Exception(e);
        }
      },
    );
    return response;
  }
}
