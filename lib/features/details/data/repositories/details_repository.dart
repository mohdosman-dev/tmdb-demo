// The implementation for remote repository
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/helpers/network_info.dart';
import 'package:tmdb_demo/dependancy_container.dart';
import 'package:tmdb_demo/features/details/data/datasources/details_datasource.dart';
import 'package:tmdb_demo/features/details/data/models/actor.dart';
import 'package:tmdb_demo/features/details/data/models/movie_details.dart';
import 'package:tmdb_demo/features/details/domain/repositories/i_details_repository.dart';

class RemoteDetailsRepository extends IDetailsRepository {
  NetworkInfoImpl networkInfo =
      NetworkInfoImpl(dataConnectionChecker: instance());

  final IDetailsDatasource datasource;

  RemoteDetailsRepository(this.datasource);

  @override
  Future<Either<List<Actor>, IFailure>> getActors(int movieId) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        return datasource.getActors(movieId);
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
  Future<Either<MovieDetails, IFailure>> getMovieDetails(int movieId) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        return datasource.getMovieDetails(movieId);
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
