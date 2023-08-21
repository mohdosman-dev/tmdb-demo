// The implementation for remote repository
import 'package:tmdb_demo/features/details/data/datasources/details_datasource.dart';
import 'package:tmdb_demo/features/details/domain/repositories/i_details_repository.dart';

class RemoteDetailsRepository extends IDetailsRepository {
  final IDetailsDatasource datasource;

  RemoteDetailsRepository(this.datasource);
}
