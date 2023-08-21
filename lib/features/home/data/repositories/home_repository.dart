import 'package:tmdb_demo/features/home/data/datasources/home_datasource.dart';
import 'package:tmdb_demo/features/home/domain/repositories/i_home_repository.dart';

// The implementation for remote repository
class RemoteHomeRepository extends IHomeRepository {
  final IHomeDatasource datasource;

  RemoteHomeRepository(this.datasource);
}
