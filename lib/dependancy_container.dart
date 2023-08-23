import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tmdb_demo/core/helpers/dio_helper.dart';
import 'package:tmdb_demo/core/helpers/network_info.dart';
import 'package:tmdb_demo/features/details/data/datasources/details_datasource.dart';
import 'package:tmdb_demo/features/details/data/repositories/details_repository.dart';
import 'package:tmdb_demo/features/details/domain/repositories/i_details_repository.dart';
import 'package:tmdb_demo/features/details/domain/usecases/get_movie_actors_usecase.dart';
import 'package:tmdb_demo/features/details/domain/usecases/get_movie_details_usecase.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_bloc.dart';
import 'package:tmdb_demo/features/home/data/datasources/home_datasource.dart';
import 'package:tmdb_demo/features/home/data/repositories/home_repository_impl.dart';
import 'package:tmdb_demo/features/home/domain/repositories/i_home_repository.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_genres_usecase.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_trending_movie_usecase.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_upcoming_movie_usecase.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_bloc.dart';

final GetIt instance = GetIt.instance;

Future<void> init() async {
  //! Feature - Home ----------------------------------------

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

  //* BLoC injections
  instance.registerLazySingleton<GenreBloc>(() => GenreBloc(instance()));
  instance.registerLazySingleton<TrendingBloc>(() => TrendingBloc(instance()));
  instance.registerLazySingleton<UpcomingBloc>(() => UpcomingBloc(instance()));

  //! Feature - Details ----------------------------------------

  //* Datasource injections
  instance.registerLazySingleton<IDetailsDatasource>(
      () => RemoteDetailsDatasourceImpl(instance()));

  //* Repository injections
  instance.registerLazySingleton<IDetailsRepository>(
      () => RemoteDetailsRepository(instance()));

  //* Usecases injections
  instance.registerLazySingleton<GetMovieDetailsUsecase>(
      () => GetMovieDetailsUsecase(instance()));
  instance.registerLazySingleton<GetMovieActorsUsecase>(
      () => GetMovieActorsUsecase(instance()));

  //* BLoC injections
  instance.registerLazySingleton<DetailsBloc>(() => DetailsBloc(instance()));
  instance.registerLazySingleton<ActorsBloc>(() => ActorsBloc(instance()));

  //* Core
  instance.registerLazySingleton(() => DioHelper());
  instance.registerLazySingleton<INetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: instance()));
  instance.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
