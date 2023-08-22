import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tmdb_demo/core/helpers/dio_helper.dart';
import 'package:tmdb_demo/core/helpers/network_info.dart';
import 'package:tmdb_demo/features/home/data/datasources/home_datasource.dart';
import 'package:tmdb_demo/features/home/data/repositories/home_repository_impl.dart';
import 'package:tmdb_demo/features/home/domain/repositories/i_home_repository.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_genres_usecase.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_trending_movie_usecase.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_upcoming_movie_usecase.dart';

final GetIt instance = GetIt.instance;

Future<void> init() async {
  //! Feature - Home

  //* Datasource injections
  instance.registerLazySingleton<IHomeDatasource>(
      () => RemoteHomeDatasourceImpl(instance()));

  //* Repository injections
  instance.registerLazySingleton<IHomeRepository>(
      () => RemoteHomeRepositoryImpl(instance()));

  //* Usecases injections
  instance.registerLazySingleton<GetGenresUsecase>(
      () => GetGenresUsecase(instance()));
  instance.registerLazySingleton<GetTrendingMoviesUsecase>(
      () => GetTrendingMoviesUsecase(instance()));
  instance.registerLazySingleton<GetUpcomingMoviesUsecase>(
      () => GetUpcomingMoviesUsecase(instance()));

  //* Core
  instance.registerLazySingleton(() => DioHelper());
  instance.registerLazySingleton<INetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: instance()));
  instance.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
