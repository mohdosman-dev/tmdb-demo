import 'package:get_it/get_it.dart';
import 'package:tmdb_demo/core/helpers/dio_helper.dart';
import 'package:tmdb_demo/features/home/data/datasources/home_datasource.dart';

final GetIt instance = GetIt.instance;

Future<void> init() async {
  //! Feature - Home

  //* Datasource injections
  instance.registerLazySingleton<IHomeDatasource>(
      () => (instance()));

  //* Core
  instance.registerLazySingleton(() => DioHelper());
}
