import 'package:dio/dio.dart';
import 'package:tmdb_demo/core/errors/failure.dart';

Response responseHandler(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      return response;
    case 500:
      throw ServerFailure('Server Error please retry later', code: 500);
    case 404:
      throw ServerFailure('Page not found', code: 404);
    case 401:
    case 403:
      throw ServerFailure(
        'Unauthorized request. Make sure api-key is set',
        code: 401,
      );
    default:
      throw ServerFailure('Unexpected error occurred, retry', code: -1);
  }
}
