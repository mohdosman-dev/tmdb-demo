import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/core/string/constants.dart';
import 'package:tmdb_demo/core/utils/response_utils.dart';

enum Method { get, post, patch, delete }

typedef ResponseConverter<T> = T Function(dynamic response);

class DioHelper {
  late Dio dio;

  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers['Connection'] = 'keep-alive';
          options.queryParameters['api_key'] = API_KEY;
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> e, ResponseInterceptorHandler handler) async {
          try {
            final Response<dynamic> result = responseHandler(e);
            return handler.next(result);
          } catch (e) {
            debugPrint('Ex: $e');
            final DioException error = DioException(
                requestOptions: RequestOptions(path: ''), error: e);
            return handler.reject(error);
          }
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {},
      ),
    );
  }

  // We use this method to request Post method apis
  Future<Either<T, IFailure>> request<T>({
    required String url,
    Method method = Method.get,
    String? baseUrl,
    Map<String, dynamic>? data,
    required ResponseConverter<T> converter,
    bool isIsolate = false,
  }) async {
    try {
      Stopwatch stopwatch = Stopwatch();
      stopwatch.start();
      Dio dio = this.dio;
      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      }
      late Response response;
      switch (method) {
        case Method.get:
          response = await dio.get(url, queryParameters: data);
          break;
        case Method.post:
          response = await dio.post(url, data: data);
          break;
        case Method.patch:
          response = await dio.patch(url, data: data);
          break;
        case Method.delete:
          response = await dio.delete(url, data: data);
          break;
        default:
      }
      stopwatch.stop();
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Left(converter(response.data));
      }

      final result = await compute(converter, response.data);
      return Left(result);
    } on DioException catch (e, stackTrace) {
      log("Exception on post request: $e \n -> $stackTrace");
      log("\n");
      String message = e.message.toString();
      return Right(
        ServerFailure(
          message,
          code: e.response?.statusCode ?? 0,
        ),
      );
    }
  }
}
