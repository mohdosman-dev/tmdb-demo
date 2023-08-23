import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/helpers/network_info.dart';
import 'package:tmdb_demo/dependancy_container.dart';
import 'package:tmdb_demo/features/home/data/datasources/home_datasource.dart';
import 'package:tmdb_demo/features/home/data/models/genre.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';
import 'package:tmdb_demo/features/home/domain/repositories/i_home_repository.dart';

// The implementation for remote repository
class RemoteHomeRepositoryImpl extends IHomeRepository {
  final IHomeDatasource datasource;
  NetworkInfoImpl networkInfo =
      NetworkInfoImpl(dataConnectionChecker: instance());

  RemoteHomeRepositoryImpl(this.datasource);

  @override
  Future<Either<List<Genre>, IFailure>> getGenres() async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        return datasource.getGenres();
      } on ServerFailure catch (e) {
        return Right(e);
      } on Exception catch (e) {
        log('Exception when fetch genre: ${e.toString()}');
        return Right(ServerFailure('Unexpected error', code: -1));
      }
    } else {
      return Right(
          OfflineFailure('You are not connected to the internet', code: -1));
    }
  }

  @override
  Future<Either<List<Movie>, IFailure>> getPopularMovies(
      Map<String, dynamic> params) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        return datasource.getPopularMovies(params);
      } on ServerFailure catch (e) {
        return Right(e);
      } on Exception catch (e) {
        log('Exception when fetch genre: ${e.toString()}');
        return Right(ServerFailure('Unexpected error', code: -1));
      }
    } else {
      return Right(
          OfflineFailure('You are not connected to the internet', code: -1));
    }
  }

  @override
  Future<Either<List<Movie>, IFailure>> getUpcomingMovies(Map<String, dynamic> params) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        return datasource.getUpcomingMovies(params);
      } on ServerFailure catch (e) {
        return Right(e);
      } on Exception catch (e) {
        log('Exception when fetch genre: ${e.toString()}');
        return Right(ServerFailure('Unexpected error', code: -1));
      }
    } else {
      return Right(
          OfflineFailure('You are not connected to the internet', code: -1));
    }
  }
}
