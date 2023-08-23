import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/helpers/network_info.dart';
import 'package:tmdb_demo/dependancy_container.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';
import 'package:tmdb_demo/features/search/data/datasource/search_datasource.dart';
import 'package:tmdb_demo/features/search/domain/repositories/i_search_repository.dart';

class RemoteSearchRepositoryImpl extends ISearchRepository {
  final ISearchDatasource datasource;
  NetworkInfoImpl networkInfo =
      NetworkInfoImpl(dataConnectionChecker: instance());

  RemoteSearchRepositoryImpl(this.datasource);

  @override
  Future<Either<List<Movie>, IFailure>> search(
      Map<String, dynamic> params) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        return datasource.search(params);
      } on ServerFailure catch (e) {
        return Right(e);
      } on Exception catch (e) {
        log('Exception when fetch data: ${e.toString()}');
        return Right(ServerFailure('Unexpected error', code: -1));
      }
    } else {
      return Right(
          OfflineFailure('You are not connected to the internet', code: -1));
    }
  }
}
