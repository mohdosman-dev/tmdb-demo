import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/helpers/dio_helper.dart';
import 'package:tmdb_demo/core/string/constants.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

abstract class ISearchDatasource {
  Future<Either<List<Movie>, IFailure>> search(Map<String, dynamic> params);
}

class RemoteSearchDatasourceImpl extends ISearchDatasource {
  final DioHelper dio;

  RemoteSearchDatasourceImpl(this.dio);
  @override
  Future<Either<List<Movie>, IFailure>> search(
      Map<String, dynamic> params) async {
    final response = await dio.request<List<Movie>>(
      url: ApiConstants.SEARCH,
      method: Method.get,
      data: params,
      converter: (response) {
        try {
          final mapList = response['results'] as List;
          return mapList.map((e) => Movie.fromMap(e)).toList();
        } catch (e, stackTrace) {
          log('StackTrace: $stackTrace');
          throw Exception(e);
        }
      },
    );
    return response;
  }
}
